Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

module TicTacToe
  class Game
    def self.start
      # Create new grid
      grid = Grid.new
      PrintGridState.new(grid.state).call

      puts "Name for Player 1"
      player1 = Player.new(name: gets.chomp, symbol: Grid::CROSS)

      puts "Name for Player 2"
      player2 = Player.new(name: gets.chomp, symbol: Grid::CROSS)
    end
  end
end

TicTacToe::Game.start
