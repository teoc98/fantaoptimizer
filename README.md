# FantaEurovision/FantaSanremo optimizer

Find the team with the best chance of winning, within the Baudi budget! 
At the moment it uses only the probabilities of winning the competition of each artist; 
such probabilities are estimated using the corresponding betting odds of various bookmakers. 

## Usage

- install [MiniZinc](https://www.minizinc.org/)
- clone the repository
- run `minizinc model.mzn <COMPETITION>/*.dzn` (e.g. `minizinc model.mzn fantasanremo23/*.dzn`)
- create your [FantaEurovision](https://fantaeurovision.com/)/[FantaSanremo](https://fantasanremo.com/) team
