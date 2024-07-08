include("player.jl")
include("trick.jl")

mutable struct Round
    starting_player::Player
    tricks::Vector{Trick}
    
    function Round(player)
        new(player, [])
    end    
end

function add_trick(round::Rouhd, trick::Trick)
    push!(round.tricks, trick)
end