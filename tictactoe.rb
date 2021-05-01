Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

grid = TicTacToe::Grid.new
TicTacToe::PrintGridState.new(grid.state).call
