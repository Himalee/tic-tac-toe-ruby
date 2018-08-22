# Tic Tac Toe

The object of Tic Tac Toe is to get three in a row. You play on a three by three game board. Players can choose their marks but traditionally the first player is known as X and the second is O. Players alternate placing Xs and Os on the game board until either opponent has three in a row or all nine squares are filled.

### To play the command line game:

1. Clone repository
2. If not already installed, install requirements with ```bundle install```
3. Once in the root directory of the project, run application with ```ruby lib/run.rb```

### To run tests:

1. Once in the root directory of the project, run application with ```rspec```

### Improvements made:
- Test suite:
![Code Coverage](/images/code_coverage.png)
- Overall structure of program
- The computer player is now unbeatable via 'Negamax' algorithm - by using recursion, the algorithm goes through all possible available spaces until an end state is reached (a game that results in a win or a draw) - it then chooses the move with the highest score (scores can be 0 for a draw, 1 for a win or -1 for a loss).
- Extracts the console so implementing another UI is possible.
- Enhances user experience through better messaging, including when users enter invalid input.

### New features:
- Users can choose a game mode - human vs human, computer vs computer and human vs computer:

![Game Mode](/images/game_mode.png)

- Users can choose the mark they would like to play with:

![Choose Mark](/images/choose_mark.png)

- Users can choose which player goes first:

![Choose First Player](/images/choose_first_player.png)
