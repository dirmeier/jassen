# Jassen

[![ci](https://github.com/dirmeier/jassen/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/dirmeier/jassen/actions/workflows/ci.yaml?query=branch%3Amain)
[![aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

> Learning Jassen with reinforcement learning

## About

`Jassen` is a Julia implementation of the popular Swiss card game. 
It implements a simple command-line interface and offers 'greedy agents' as opponents.

## Usage

To play a game of Jassen with 4 greedy players, call

```bash
cd jasssen
julia --project=. main.jl
```

You can, so far, specify two different player types using

```bash
julia --project=. main.jl --player1 human --player2 greedy
```

## Installation

Install [Julia](https://julialang.org/downloads/) and then download the repository via:

```bash
git clone https://github.com/dirmeier/jassen.git
```

Then install all dependencies using

```bash
cd jassen
julia --project=. -e "import Pkg; Pkg.instantiate();"
```


## Author

Simon Dirmeier <a href="mailto:sfyrbnd @ pm me">sfyrbnd @ pm me</a>
