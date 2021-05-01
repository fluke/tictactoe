Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

module TicTacToe
  class Game
    def self.start
      # Create new grid
      grid = Grid.new
      grid.print

      puts "\nName for Player 1"
      player1 = Player.new(gets.chomp, Grid::CROSS)

      puts "\nName for Player 2"
      player2 = Player.new(gets.chomp, Grid::NOUGHT)

      turn_count = 1

      while !CheckVictory.new(grid.state).call
        player = turn_count % 2 == 1 ? player1 : player2

        while true
          begin
            puts "\n#{player.name}'s turn"
            puts "X Coordinate"
            x = gets.chomp.to_i
            puts "Y Coordinate"
            y = gets.chomp.to_i

            grid.make_move(x, y, player.symbol)
            break
          rescue InvalidMoveError
          end
        end

        puts
        grid.print
        puts

        turn_count += 1
      end
    end
  end
end

TicTacToe::Game.start
