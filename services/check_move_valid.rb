module TicTacToe
  class CheckMoveValid
    attr_reader :error_message

    def initialize(state, x, y, symbol)
      @state = state
      @x = x
      @y = y
      @symbol = symbol
      @error_message = nil
    end

    def call
      # Making the assumption that turns for X and O will be made alternately
      # So we're not checking if X or O are playing multiple turns in a row

      if !(0..2).include?(@x) || !(0..2).include?(@y)
        @error_message = "Invalid move: Coordinates are invalid. X and Y should be either 0, 1, or 2"
        return false
      end

      if [Grid::CROSS, Grid::NOUGHT].include?(@state[@x][@y])
        @error_message = "Invalid move: Space is not empty"
        return false
      end

      true
    end
  end
end
