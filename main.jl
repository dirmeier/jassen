#!/usr/bin/julia

include("src/model/player/greedy_player.jl")
include("src/model/game.jl")
include("src/controller.jl")

(
    function ()
        players = [
            GreedyPlayer(1, 1), GreedyPlayer(2, 2), GreedyPlayer(3, 1), GreedyPlayer(4, 2)
        ]
        game = Game(players, 12345)
        controller = Controller(game)
        play_round(controller)
        return println("done")
    end
)()
