import StatsBase: countmap                                                                                                                                             

include("../trick.jl")
include("../card.jl")
include("player.jl")


mutable struct GreedyPlayer <: Player
end

function play_card(player::GreedyPlayer, trick::Trick) 
    player_has_trump = _has_trump(player, trick)
    if is_first_card(trick)
        if player_has_trump
            return _play_lowest_trump_card(player, trick)
        else
            return _play_random_card(player)
        end
    end

    first_card_trump = first_card_is_trump(trick)
    if first_card_trump && !player_has_trump
        return _play_random_card(player)
    end

    if first_card_trump && player_has_trump
        for player_card in player.cards
            if !is_trump(trick, player_card)
                continue
            end
            if can_take_trick(trick, player_card)
                _remove_card(player, player_card)
                return player_card            
            end
        end
    end

    if !first_card_is_trump
        for player_card in player.cards
            if can_take_trick(trick, player_card)
                _remove_card(player, player_card)
                return player_card
            end
        end
        for player_card in player.cards
            if has_same_suit_as_first_card(trick, player_card)
                _remove_card(player, player_card)
                return player_card
            end
        end
    end
    card = _play_random_card(player)
    return card
end

function _remove_card(player::Player, card::Card)
    deleteat!(player.cards, findall(x->x==card, player.cards))
end

function _play_lowest_trump_card(player::GreedyPlayer, trick::Trick) 
    trumps = Vector{Card}()
    for card in player.cards
        if is_trump(trick, card)
            push!(trumps, card)
        end
    end
    lowest_trump = sort(trumps)[end]        
    _remove_card(player, lowest_trump)
    return lowest_trump
end

function _play_random_card(player::GreedyPlayer)
    return pop!(player.cards)
end

function _has_trump(player::GreedyPlayer, trick::Trick) 
    for card in player.cards
        if is_trump(trick, card)
            return true
        end
    end
    return false
end

function decide_game_variant(player::GreedyPlayer)
    counts = countmap([card.suit for card in player.cards])
    sorted_counts = sort(collect(counts), by=x->x[2])
    # return the suit as string with the highest number of counts
    return string(sorted_counts[end][2])
end