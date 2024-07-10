
import REPL
using REPL.TerminalMenus

include("../trick.jl")
include("../card.jl")
include("player.jl")

mutable struct HumanPlayer <: Player
    player_idx::Int
    team::Integer
    cards::Vector{Card}
    is_playing_team::Bool

    function HumanPlayer(player_idx::Integer, team::Integer)
        return new(player_idx, team, [], false)
    end
end

function play_card(player::HumanPlayer, trick::Trick, state::Matrix{Integer})
    menu = RadioMenu([string(card) for card in player.cards]);
    choice = request("Pick a card", menu);
    card = player.cards[choice]
    deleteat!(player.cards, choice)
    return card
end

function decide_game_variant(player::HumanPlayer)
    for card in player.cards
        print(card, " ")
    end
    println()
    vars = ["eichel", "schilten", "rosen",  "schellen"]
    menu = RadioMenu(vars);
    choice = request("Pick a game", menu);    
    return vars[choice]
end