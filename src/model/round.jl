include("player/player.jl")
include("trick.jl")

mutable struct Round
    starting_player::Player
    tricks::Vector{Trick}

    function Round(player)
        return new(player, [])
    end
end

function add_trick(round::Round, trick::Trick)
    return push!(round.tricks, trick)
end
