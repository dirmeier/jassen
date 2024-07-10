# Jassen

[![ci](https://github.com/dirmeier/jassen/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/dirmeier/jassen/actions/workflows/ci.yaml?query=branch%3Amain)
[![aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

> Learning Jassen with reinforcement learning

## About

`Jassen` is a Julia implementation of the popular Swiss card game where we train a reinforcement learning agent as player.

## Usage

To play a game of Jassen, call:

```
cd jasssen
julia --project=. main.jl
```

This creates a game with 3 greedy bots and 1 human player:

```julia
#!/usr/bin/julia

include("src/model/player/greedy_player.jl")
include("src/model/player/human_player.jl")
include("src/model/game.jl")

(
    function ()
        players = [
            HumanPlayer(1, 1), GreedyPlayer(2, 2), GreedyPlayer(3, 1), GreedyPlayer(4, 2)
        ]
        game = Game(players, 12345)

        play_round(game)
        return println("done")
    end
)()
```

To play against the RL agent (or multiple RL agents), create a script and  the code to:

```julia
#!/usr/bin/julia

include("src/model/player/greedy_player.jl")
include("src/model/player/ai_player.jl")
include("src/model/player/human_player.jl")
include("src/model/game.jl")

(
    function ()
        players = [
            HumanPlayer(1, 1), AIPlayer(2, 2), GreedyPlayer(3, 1), GreedyPlayer(4, 2)
        ]
        game = Game(players, 12345)

        play_round(game)
        return println("done")
    end
)()
```