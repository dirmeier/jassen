
@enum Suit eichel=0 schilten=1 rosen=2 schellen=3
@enum Symbol ass=0 könig=1 ober=2 under=3 zehn=4 neun=5 acht=6 sieben=7 sechs=8


mutable struct Card
    suit::Suit   
    symbol::Symbol
    encoding::Int8
    value::Int8
   
    function Card(suit::Suit, symbol::Symbol)
        new(suit, symbol, 1, 2)
    end
end


hashmap = Dict("language"=>"julia","version"=>"0.6")

repr = Dict(
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
    (eichel, ass) => 0,
    (eichel, könig) => 1,
    (eichel, ober) => 2,
    (eichel, under) => 3,
    (eichel, zehn) => 4,
    (eichel, neun) => 5,
    (eichel, acht) => 6,
    (eichel, sieben) => 7,
    (eichel, sechs) => 8,

    (schilten, ass) => 9,
    (schilten, könig) => 10,
    (schilten, ober) => 11,
    (schilten, under) => 12,
    (schilten, zehn) => 13,
    (schilten, neun) => 14,
    (schilten, acht) => 15,
    (schilten, sieben) => 16,
    (schilten, sechs) => 17,

    (rosen, ass) => 18,
    (rosen, könig) => 19,
    (rosen, ober) => 20,
    (rosen, under) => 21,
    (rosen, zehn) => 22,
    (rosen, neun) => 23,
    (rosen, acht) => 24,
    (rosen, sieben) => 25,
    (rosen, sechs) => 26,

    (schellen, ass) => 27,
    (schellen, könig) => 28,
    (schellen, ober) => 29,
    (schellen, under) => 30,
    (schellen, zehn) => 31,
    (schellen, neun) => 32,
    (schellen, acht) => 33,
    (schellen, sieben) => 34,
    (schellen, sechs) => 35,
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
