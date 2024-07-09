include("../card.jl")

abstract type Player end

function Base.show(io::IO, player::Player)
    a = join([string(card) for card in player.cards], ", ")
    b = "$(typeof(player)) $(player.player_idx) of team $(string(player.team)) with cards: "
    return println(io, string(b, a))
end

function take_card(player::Player, card::Card)
    return push!(player.cards, card)
end

function print_cards(player::Player)
    a = join([string(card) for card in player.cards], ", ")
    return println(a)
end
