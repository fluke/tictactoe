Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

module TicTacToe
  class Game
    def self.start
      # Create new grid
      grid = Grid.new
      print grid

      puts "\nName for Player 1"
      player1 = Player.new(gets.chomp, Grid::CROSS)

      puts "\nName for Player 2"
      player2 = Player.new(gets.chomp, Grid::NOUGHT)

      turn_count = 1

      while true
        check_result = CheckResult.new(grid.state)

        if check_result.call
          puts "\nGAME OVER: "
          case check_result.winning_symbol
          when Grid::EMPTY
            print "DRAW"
          when Grid::CROSS
            print "PLAYER 1 WINS"
          when Grid::NOUGHT
            print "PLAYER 2 WINS"
          end

          break
        end

        player = turn_count % 2 == 1 ? player1 : player2

        while true
          puts "\n#{player.name}'s turn"
          puts "X Coordinate: (0, 1, 2)"
          x = gets.chomp.to_i
          puts "Y Coordinate: (0, 1, 2)"
          y = gets.chomp.to_i

          break if grid.make_move(x, y, player.symbol)
        end

        puts
        print grid
        puts

        turn_count += 1
      end
    end
  end
end

TicTacToe::Game.start
