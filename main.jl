#!/usr/bin/julia

using ArgParse

include("src/model/player/greedy_player.jl")
include("src/model/player/human_player.jl")
include("src/model/player/ai_player.jl")
include("src/model/game.jl")

(
    function (args)
        settings = ArgParseSettings()
        player_types = ["human", "greedy", "agent"]
        @add_arg_table settings begin
            "--player1"
                help = "what kind of player is player 1; must be one of " *  join(player_types, ", ")
                default = "greedy"
                range_tester = (x -> x in player_types)
            "--player2"
                help = "what kind of player is player 2; must be one of " *  join(player_types, ", ")
                default = "greedy"
                range_tester = (x -> x in player_types)
            "--player3"
                help = "what kind of player is player 3; must be one of " *  join(player_types, ", ")
                default = "greedy"
                range_tester = (x -> x in player_types)
            "--player4"
                help = "what kind of player is player 4; must be one of " *  join(player_types, ", ")
                default = "greedy"
                range_tester = (x -> x in player_types)
        end
        args = parse_args(args, settings)        

        function dispatch(tag)
            return Dict("human" => HumanPlayer, "greedy" => GreedyPlayer, "ai" => AIPlayer)[tag]
         end

        players = [
            dispatch(args[string("player", i)])(i, i % 4)
            for i in range(1, 4)
        ]
        game = Game(players, 12345)

        play_round(game)
        return println("done")
    end
)(ARGS)
