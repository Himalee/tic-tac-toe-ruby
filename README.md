# Tic Tac Toe

The object of Tic Tac Toe is to get three in a row. You play on a three by three game board. Players can choose their marks but traditionally the first player is known as X and the second is O. Players alternate placing Xs and Os on the game board until either opponent has three in a row or all nine squares are filled.

### To run game:

1. Clone repository
2. If not already installed, install requirements with ```bundle install```
3. Run application with ```ruby lib/run.rb```

### To run tests:

1. Use ```rspec``` command


### Improvements made:
- Test suite
- Overall structure of program - use of classes to separate concerns
- The computer player is now unbeatable via 'Negamax' algorithm
- Extracts the console so implementing another UI is possible
- Enhances user experience through better messaging, including when user enters invalid input

### New features:
- Users can choose a game mode - human vs human, computer vs computer and human vs computer
- Users can choose which player goes first
- Users can choose the mark they would like to play with
