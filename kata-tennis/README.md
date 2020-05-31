# kata-tennis
Coding Dojo Kata about implementing a simple tennis game. The description of that is [here](https://github.com/codingdojo-org/codingdojo.org/blob/master/content/kata/Tennis.md).

## To Run this CLI

1. Download and unzip
1. Open /bin/tennis_game.rb from terminal (you'll need Ruby installed)

## High-level Notes about Current Version

* I resolved namespace issues and moved methods and variables into better places where they could at least be used by the other methods that needed them.
* I think there's still a lot I could do to reduce method complexity and be more OOPy.
* The next thing I want to do is let the user write to a config file which will be used by helper method file.

### Stream of more detailed notes from when I bothered to start writing notes onward:
* Made `@@winner`, `@@services` and `@@players` into instance variables of `Tennis`
* Added `@deuces`
* Moved `get_score` out of `Player` into `Tennis` and removed deuce check from it
* Created `say_score` which can check for deuce on its own and say the right thing rather than "Advantage" being a score
* Used new `@deuces` counter in `say score` and game summary (if game sufficiently epic)
* Added to flow to shovel new `Player`s immediately into `@players` array which is now part of `Tennis`
* Prevent player names that are the other player's `@number`
* Moved `@number` assignment out to flow to be passed in upon `Player` instantiation
* Removed `@score` and `#score` from `Player`. `Tennis.get_score(player)` now translates player points into tennis scores for the purposes of `Tennis.say_score`.
