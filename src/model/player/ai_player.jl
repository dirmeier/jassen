
include("../trick.jl")
include("../card.jl")
include("player.jl")

mutable struct AIPlayer <: Player
    player_idx::Int
    team::Integer
    cards::Vector{Card}
    is_playing_team::Bool

    function AIPlayer(player_idx::Integer, team::Integer)
        return new(player_idx, team, [], false)
    end
end