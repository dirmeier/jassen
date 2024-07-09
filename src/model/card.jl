
@enum Suit eichel=0 schilten=1 rosen=2 schellen=3
@enum Symbol ass=0 könig=1 ober=2 under=3 zehn=4 neun=5 acht=6 sieben=7 sechs=8


mutable struct Card
    suit::Suit   
    symbol::Symbol
    encoding::Int8
    value::Int8
   
    function Card(suit::Suit, symbol::Symbol)
        new(suit, symbol, encodings[(suit, symbol)], values[(suit, symbol)])
    end
end

function Base.show(io::IO, card::Card)
    print(io, repres[card.suit, card.symbol])
end

function Base.isless(lhs::Card, rhs::Card)
    if Integer(lhs.suit) == Integer(rhs.suit)
        return Integer(lhs.symbol) <= Integer(rhs.symbol)
    end
    return Integer(lhs.suit) < Integer(rhs.suit)
end


repres = Dict(
    (eichel, ass) => "🌰A",
    (eichel, könig)=> "🌰K",
    (eichel, ober)=> "🌰O",
    (eichel, under)=> "🌰U",
    (eichel, zehn)=> "🌰10",
    (eichel, neun)=> "🌰9",
    (eichel, acht)=> "🌰8",
    (eichel, sieben)=> "🌰7",
    (eichel, sechs)=> "🌰6",

    (schilten, ass)=> "🛡A",
    (schilten, könig)=> "🛡K",
    (schilten, ober)=> "🛡O",
    (schilten, under)=> "🛡U",
    (schilten, zehn)=> "🛡10",
    (schilten, neun)=> "🛡9",
    (schilten, acht)=> "🛡8",
    (schilten, sieben)=> "️🛡7",
    (schilten, sechs)=> "🛡6",

    (rosen, ass)=> "🌹A",
    (rosen, könig)=> "🌹K",
    (rosen, ober)=> "🌹O",
    (rosen, under)=> "🌹U",
    (rosen, zehn)=> "🌹10",
    (rosen, neun)=> "🌹9",
    (rosen, acht)=> "🌹8",
    (rosen, sieben)=> "🌹7",
    (rosen, sechs)=> "🌹6",

    (schellen, ass)=> "🏀A",
    (schellen, könig)=> "🏀K",
    (schellen, ober)=> "🏀O",
    (schellen, under)=> "🏀U",
    (schellen, zehn)=> "🏀10",
    (schellen, neun)=> "🏀9",
    (schellen, acht)=> "🏀8",
    (schellen, sieben)=> "🏀7",
    (schellen, sechs)=> "🏀6",
)

encodings = Dict(
    (eichel, ass) => 1,
    (eichel, könig) => 2,
    (eichel, ober) => 3,
    (eichel, under) => 4,
    (eichel, zehn) => 5,
    (eichel, neun) => 6,
    (eichel, acht) => 7,
    (eichel, sieben) => 8,
    (eichel, sechs) => 9,

    (schilten, ass) => 10,
    (schilten, könig) => 11,
    (schilten, ober) => 12,
    (schilten, under) => 13,
    (schilten, zehn) => 14,
    (schilten, neun) => 15,
    (schilten, acht) => 16,
    (schilten, sieben) => 17,
    (schilten, sechs) => 18,

    (rosen, ass) => 19,
    (rosen, könig) => 20,
    (rosen, ober) => 21,
    (rosen, under) => 22,
    (rosen, zehn) => 23,
    (rosen, neun) => 24,
    (rosen, acht) => 25,
    (rosen, sieben) => 26,
    (rosen, sechs) => 27,

    (schellen, ass) => 28,
    (schellen, könig) => 29,
    (schellen, ober) => 30,
    (schellen, under) => 31,
    (schellen, zehn) => 32,
    (schellen, neun) => 33,
    (schellen, acht) => 34,
    (schellen, sieben) => 35,
    (schellen, sechs) => 36,
)

values = Dict(
    (eichel, ass) => 3,
    (eichel, könig) => 3,
    (eichel, ober) => 3,
    (eichel, under) => 3,
    (eichel, zehn) => 3,
    (eichel, neun) => 3,
    (eichel, acht) => 3,
    (eichel, sieben) => 3,
    (eichel, sechs) => 3,

    (schilten, ass) => 3,
    (schilten, könig) => 3,
    (schilten, ober) => 3,
    (schilten, under) => 3,
    (schilten, zehn) => 3,
    (schilten, neun) => 3,
    (schilten, acht) => 3,
    (schilten, sieben) => 3,
    (schilten, sechs) => 3,

    (rosen, ass) => 3,
    (rosen, könig) => 3,
    (rosen, ober) => 3,
    (rosen, under) => 3,
    (rosen, zehn) => 3,
    (rosen, neun) => 3,
    (rosen, acht) => 3,
    (rosen, sieben) => 3,
    (rosen, sechs) => 3,

    (schellen, ass) => 3,
    (schellen, könig) => 3,
    (schellen, ober) => 3,
    (schellen, under) => 3,
    (schellen, zehn) => 3,
    (schellen, neun) => 3,
    (schellen, acht) => 3,
    (schellen, sieben) => 3,
    (schellen, sechs) => 3,
)
