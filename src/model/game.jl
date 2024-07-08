import Random: shuffle
import StableRNGs: StableRNG

include("player/player.jl")
include("player/human_player.jl")
include("card.jl")
include("round.jl")

N_CARDS = 36
N_PLAYERS = 4
N_ROUNDS = 12
N_TRICKS_PER_ROUND = 9

mutable struct Game
    players::Vector{Player}
    cards::Vector{Card}
    rounds::Vector{Round}
    rng::Any

    function Game(players::Vector{T}, seed::Integer) where {T<:Player}
        return new(
            players,
            [Card(su, sy) for su in instances(Suit) for sy in instances(Symbol)],
            [],
            StableRNG(seed),
        )
    end
end

function play_round(game::Game)
    move_to_next_player(game)
    state = deal(game)
    current_game_variant = decide_game_variant(game)
    round = Round(game.players[1])
    for i in range(1, N_TRICKS_PER_ROUND)
        trick, state = play_trick(game, i, current_game_variant, state)
        add_trick(round, trick)
    end
    return push!(game.rounds, round)
end

function deal(game::Game)
    println("dealing cards")
    idxs = shuffle(game.rng, [1:N_CARDS;])
    cards = [deepcopy(game.cards[idx]) for idx in idxs]
    state = zeros(Integer, (N_CARDS, N_PLAYERS + 1))
    while !isempty(cards)
        for player in game.players
            if !isempty(cards)
                card = pop!(cards)
                take_card(player, card)
                state[card.encoding, player.player_idx] = 1
            end
        end
    end
    for player in game.players
        println(player)
    end
    return state
end

function decide_game_variant(game::Game)
    current_game_variant = decide_game_variant(game.players[1])
    a = "$(typeof(game.players[1])) $(game.players[1].player_idx) starts the round "
    b = "and decides on game variant: $(current_game_variant)"
    println(string(a, b))
    return current_game_variant
end

function play_trick(
    game::Game, trick_idx::Integer, current_game_variant::String, state::Matrix{Integer}
)
    trick = Trick(trick_idx, game.players[1], current_game_variant)
    println("player $(game.players[1].player_idx) is opening the trick")
    for player in game.players
        if typeof(player) == HumanPlayer
            print("human player $(player.plyer_idx)'s turn")
            print_trick_until_now(trick)
        end
        card = play_card(player, trick, state)
        state = add_card_and_update(trick, player, card, state)
    end
    trick = decide_winner_and_count_trick(game, trick)
    return trick, state
end

function decide_winner_and_count_trick(game::Game, trick::Trick)
    best_idx, (best_player, best_card) = 1, trick.played_cards[1]
    for (idx, (player_idx, card)) in enumerate(trick.played_cards[2:end])
        if new_card_trumps_another_card(trick, card, best_card)
            best_idx, best_player, best_card = idx + 1, player_idx, card
        end
    end
    declare_winner(trick, best_idx, best_player)
    idx = [id for id in [1:4;] if game.players[id].player_idx == best_player.player_idx][1]
    game.players = append!(game.players[idx:end], game.players[1:(idx - 1)])
    println(trick)
    return trick
end

function move_to_next_player(game::Game)
    if isempty(game.rounds)
        return nothing
    end

    new_starting_player_idx = (game.rounds[end].starting_player.player_idx + 1) % 4 + 1

    idx = [id for id in [1:4;] if game.players[id].player_idx == new_starting_player_idx][1]
    game.players = append!(game.players[idx:end], game.players[1:(idx - 1)])

    for (player, is_playing) in zip(game.players, [true, false, true, false])
        player.is_playing_team = is_playing
    end
end
