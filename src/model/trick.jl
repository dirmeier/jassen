include("player.jl")
include("card.jl")


mutable struct Trick
    trick_idx::Integer
    starting_player::Player
    game_variant::String
    played_cards::Vector{Tuple{Player, Card}}
    winner::Player
    winning_idx::Int8
end


function Base.show(io::IO, trick::Trick) 
  a = "finished trick $(trick.trick_idx) " 
  b = "$(trick.game_variant), starting player $(trick.starting_player.player_idx), winning player idx $(trick.winning_idx)): " 
  c =  join([string(card) for (player, card) in trick.played_cards], ", ")
  print(io, string(a, b, c))
end


function print_trick_until_now(trick::Trick) 
  print("current trick $(trick.trick_idx) (game $(trick.game_variant), starting player $(trick.starting_player.player_idx))")
  c = string(join([string(card) for (player, card) in trick.played_cards], ", "))
  print(string("played so far: ", c))
end

function declare_winner(trick::Trick, winning_idx::Int, player::Player) 
  trick.winner = player
  trick.winning_idx = winning_idx
end

function add_card_and_update(trick::Trick, player::Player, card::Card, state::Vector{Vector{Integer}}) 
  push!(trick.played_cards, (player, card))
  state[card.encoding, end] = 1
  state[card.encoding, player.player_idx] = 0
  return state
end


function can_take_trick(trick::Trick, new_card::Card)
  best_card = trick.played_cards[1]

  for (_, played_card) in trick.played_cards[2:end] 
    if new_card_trumps_another_card(trick, best_card, played_card)
        best_card = played_card
    end
  end

  return new_card_trumps_another_card(trick, best_card, new_card)
end

function new_card_trumps_another_card(trick::Trick, old_card::Card, new_card::Card)
  old_card_is_trump = trick.game_variant == string(old_card.suit)
  new_card_is_trump = trick.game_variant == string(new_card.suit)
  if old_card_is_trump && !new_card_is_trump
    return false
  end
  if !old_card_is_trump && new_card_is_trump
    return true
  end
  if old_card.suit == new_card.suit
    if new_card.symbol < old_card.symbol
      return true
    end
    return false
  end
  return false
end

function is_first_card(trick::Trick)
  return length(trick.played_cards) == 0
end

function first_card_is_trump(trick::Trick)
  return trick.game_variant == string(trick.played_cards[1][2].suit)
end

function is_trump(trick::Trick, card::Card)
  return trick.game_variant == string(card.suit)
end

function has_same_suit_as_first_card(trick::Trick, card::Card)
  return string(card.suit) == string(trick.played_cards[1][2].suit)
end