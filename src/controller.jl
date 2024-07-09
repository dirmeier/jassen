include("model/game.jl")

mutable struct Controller
    game::Game    
end


function play_round(controller::Controller)
    for _ in range(1, 1)
        print("")
        play_round(controller.game)
        print("")
    end
end

function is_end_of_game(controller::Controller)
    print("end of game")
    return true
end