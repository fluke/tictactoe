module TicTacToe
  class InvalidMoveError < StandardError; end

  class CheckMoveValid
    def initialize(state, x, y, symbol)
      @state = state
      @x = x
      @y = y
      @symbol = symbol
    end

    def call
      if !(0..2).include?(@x) || !(0..2).include?(@y)
        puts "Invalid move: Coordinates are invalid. X and Y should be either 0, 1, or 2"
        raise InvalidMoveError
      end

      if [Grid::CROSS, Grid::NOUGHT].include?(@state[@x][@y])
        puts "Invalid move: Space is not empty"
        raise InvalidMoveError
      end
    end
  end
end
