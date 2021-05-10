require 'secure_random'

Dir[File.dirname(__FILE__) + '/lib/*.rb'].each { |file| require file }
Dir[File.dirname(__FILE__) + '/services/*.rb'].each { |file| require file }

module TicTacToe
  class Game
    def initialize(game_id = SecureRandom.uuid)
      @game_id = game_id
    end

    def orchestrate
      player1 = Player.new(name: "Swanand", symbol: Grid::CROSS, computer: false)
      player2 = Player.new(name: "Kartik", symbol: Grid::NOUGHT, computer: false)

      grid = Grid.new(player1, player2)

      loop do
        input = get_input(grid.current_player)
        parse_input(input)
      end
    end

    private

    def parse_input(input)
      input.split.map(&:to_i)
    end

    def get_input(player)
      filename = filename(player.symbol)
      File.readlines(filename)[-1]
    end

    def filename(symbol)
      "game#{@game_id}_#{symbol}"
    end

    def start
      # Create new grid

      print grid

      # Get players
      puts "\nPlay against computer? Y/N"
      computer_opponent = gets.chomp == 'Y' ? true : false

      if computer_opponent
        puts "\nPlay against hard computer? Y/N"
        computer_difficulty = gets.chomp == 'Y' ? :hard : :easy
      end

      puts "\nName for Player 1"
      player1 = Player.new(name: gets.chomp, symbol: Grid::CROSS, computer: false)

      if computer_opponent
        player2 = Player.new(name: "Computer", symbol: Grid::NOUGHT, computer: computer_difficulty)
      else
        puts "\nName for Player 2"
        player2 = Player.new(name: gets.chomp, symbol: Grid::NOUGHT, computer: false)
      end

      # Take turns
      turn_count = 1

      while true
        break if check_result(grid)

        player = (turn_count % 2 == 1) ? player1 : player2
        player_turn(grid, player)

        puts "\n#{grid}\n"

        turn_count += 1
      end
    end

    def check_result(grid)
      check_result = CheckResult.new(grid.state).call

      if check_result.status == :complete
        puts "\nGAME OVER: "
        case check_result.winning_symbol
        when nil
          print "DRAW"
        when Grid::CROSS
          print "PLAYER 1 WINS"
        when Grid::NOUGHT
          print "PLAYER 2 WINS"
        end

        return true
      end

      false
    end

    def player_turn(grid, player)
      if player.computer
        puts "\n#{player.name}'s turn"
        move = player.computer == :hard ?
          MakeOptimalMove.new(grid.state).call :
          MakeRandomMove.new(grid.state).call

        grid.make_move(move[0], move[1], player.symbol)
      else
        while true
          puts "\n#{player.name}'s turn"
          puts "X Coordinate: (0, 1, 2)"
          x = gets.chomp.to_i
          puts "Y Coordinate: (0, 1, 2)"
          y = gets.chomp.to_i

          break if grid.make_move(x, y, player.symbol)
        end
      end
    end
  end
end

TicTacToe::Game.new(1).orchestrate
