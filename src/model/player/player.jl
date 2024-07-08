include("../card.jl")

abstract type Player end

function Base.show(io::IO, player::Player) 
    a = string(print_cards(player))
    b =  "$(typeof(player)) $(player.player_idx) of team $(string(player.team)) with cards: "    
    print(io, string(a, b))
  end

function take_card(player::Player, card::Card)
  push!(player.cards, card)
end

function print_cards(player::Player)
  a = join([string(card) for card in player.cards], ", ")
  print(a)
end