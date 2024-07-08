include("../card.jl")

mutable struct Player
    player_idx::Integer
    team::Integer
    cards::Vector{Card}
    is_playing_team::Bool

    function Player()
        throw(InitError("constroctur of abstract struct player called. do not use directly but its subclasses."))
    end
end

function Base.show(io::IO, player::Player) 
    a = string(print_cards(player))
    b =  "$(typeof(player)) $(player.player_idx) of team $(string(player.team)) with cards: "    
    print(io, string(a, b))
  end

  function has_trump(player::Player, trick::Trick)
    for card in player.cards
        if is_trump(trick, card)
            return true
        end
    end
  end

  function take_card(player::Player, card::Card)
    push!(player.cards, card)
  end

  function print_cards(player::Player)
    a = join([string(card) for card in player.cards], ", ")
    print(a)
  end