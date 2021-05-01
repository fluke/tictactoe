# Tic Tac Toe

## Running

To run the game, run the command `ruby tictactoe.rb`. The grid follows the usual X and Y axis grid. Like follows:

2  * * *
1  * * *
0  * * *
Y
 X 0 1 2

## Project Structure

The project is structured as following:
- lib: This is the folder with all the object classes. Including the classes for the Grid and Player objects.
- services: This folder contains the services that contain the domain logic for the game.
- test: This folder contains tests for all the classes.

## Testing

The tests are written in minitest. You can run the entire suite with the command `ruby -Itest -e 'ARGV.each { |f| require f }' ./test/**/*_test.rb`.
