include("player/player.jl")
include("card.jl")

mutable struct Trick
    trick_idx::Integer
    starting_player::Player
    game_variant::String
    played_cards::Vector{Tuple{Player,Card}}
    winner::Union{Missing,Player}
    winning_idx::Integer

    function Trick(
        idx::Integer, player::T, game_variant::String
    ) where {T<:Union{Missing,Player}}
        return new(idx, player, game_variant, [], missing, -1)
    end
end

function Base.show(io::IO, trick::Trick)
    a = "finished trick $(trick.trick_idx) "
    b = "$(trick.game_variant), starting player $(trick.starting_player.player_idx), winning player $(trick.winner.player_idx)/idx $(trick.winning_idx)): "
    c = join([string(card) for (player, card) in trick.played_cards], ", ")
    return print(io, string(a, b, c))
end

function print_trick_until_now(trick::Trick)
    println(
        "current trick $(trick.trick_idx) (game $(trick.game_variant), starting player $(trick.starting_player.player_idx))",
    )
    c = string(join([string(card) for (player, card) in trick.played_cards], ", "))
    println(string("played so far: ", c))
end

function declare_winner(trick::Trick, winning_idx::Int, player::Player)
    trick.winner = player
    return trick.winning_idx = winning_idx
end

function add_card_and_update(
    trick::Trick, player::Player, card::Card, state::Matrix{Integer}
)
    push!(trick.played_cards, (player, card))
    state[card.encoding, end] = 1
    state[card.encoding, player.player_idx] = 0
    return state
end

function can_take_trick(trick::Trick, new_card::Card)
    best_card = trick.played_cards[1][2]

    for (_, card) in trick.played_cards[2:end]
        if new_card_trumps_another_card(trick, best_card, card)
            best_card = card
        end
    end

    return new_card_trumps_another_card(trick, best_card, new_card)
end

function new_card_trumps_another_card(trick::Trick, old_card::Card, new_card::Card)
    old_card_is_trump = trick.game_variant == string(old_card.suit)
    new_card_is_trump = trick.game_variant == string(new_card.suit)
    if old_card_is_trump && !new_card_is_trump
        return false
    end
    if !old_card_is_trump && new_card_is_trump
        return true
    end
    if old_card.suit == new_card.suit
        if new_card.symbol < old_card.symbol
            return true
        end
        return false
    end
    return false
end

function is_first_card(trick::Trick)
    return length(trick.played_cards) == 0
end

function first_card_is_trump(trick::Trick)
    var= trick.game_variant 
    fc =  string(trick.played_cards[1][2].suit)
    return var == fc
end

function is_trump(trick::Trick, card::Card)
    return trick.game_variant == string(card.suit)
end

function has_same_suit_as_first_card(trick::Trick, card::Card)
    return string(card.suit) == string(trick.played_cards[1][2].suit)
end

function has_trump(trick::Trick, player::Player)
    for card in player.cards
        if is_trump(trick, card)
            return true
        end
    end
end
