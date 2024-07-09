module Jassen
    
    using Random
    using StatsBase
    using StableRNGs

    import Random: shuffle
    import StatsBase: countmap
    import StableRNGs: StableRNG
    
    include(joinpath("model", "card.jl"))
    include(joinpath("model", "trick.jl"))
    include(joinpath("model", "round.jl"))
    
    include(joinpath("model", "player", "player.jl"))
    include(joinpath("model", "player", "ai_player.jl"))
    include(joinpath("model", "player", "greedy_player.jl"))
    include(joinpath("model", "player", "human_player.jl"))    
    
    include(joinpath("model", "game.jl"))
end