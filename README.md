# Jassen

[![ci](https://github.com/dirmeier/jassen/actions/workflows/ci.yaml/badge.svg?branch=main)](https://github.com/dirmeier/jassen/actions/workflows/ci.yaml?query=branch%3Amain)
[![aqua](https://raw.githubusercontent.com/JuliaTesting/Aqua.jl/master/badge.svg)](https://github.com/JuliaTesting/Aqua.jl)

> Learning Jassen with reinforcement learning

## About

`Jassen` is a Julia implementation of the popular Swiss card game. It implements a simple command-line interface and offers greedy and RL trained agents as opponents.

## Usage

To play a game of Jassen, call:

```bash
cd jasssen
julia --project=. main.jl
```

This creates a game with 4 greedy bots.

To play yourself against the RL agent (or multiple RL agents), you can specify player types using:

```bash
julia --project=. main.jl --player1 human --player2 ai
```

## Installation

Install [Julia](https://julialang.org/downloads/) and then download the repository via:

```bash
git clone https://github.com/dirmeier/jassen.git
```

You can then call the above command and everything sets up automatically.


## Author

Simon Dirmeier <a href="mailto:sfyrbnd @ pm me">sfyrbnd @ pm me</a>
