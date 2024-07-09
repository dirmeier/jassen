#!/usr/bin/julia

import Jassen: GreedyPlayer, Game

(
    function ()
        players = [
            GreedyPlayer(1, 1), GreedyPlayer(2, 2), GreedyPlayer(3, 1), GreedyPlayer(4, 2)
        ]
        game = Game(players, 12345)        
        play_round(game)
        return println("done")
    end
)()
