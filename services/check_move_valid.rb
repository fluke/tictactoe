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
      flattened_state = @state.flatten
      num_crosses = flattened_state.count(Grid::CROSS)
      num_noughts = flattened_state.count(Grid::NOUGHT)

      if !(symbol == Grid::CROSS && num_crosses == num_noughts)
        @error_message = "Invalid move: playing symbol out of order"
        return false
      end

      if !(symbol == Grid::NOUGHT && (num_crosses == num_noughts + 1))
        @error_message = "Invalid move: playing symbol out of order"
        return false
      end

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
