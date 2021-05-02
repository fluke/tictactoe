# The grid follows the usual X and Y axis grid. Like follows:
# 2  * * *
# 1  * * *
# 0  * * *
# Y
#  X 0 1 2

module TicTacToe
  class MakeOptimalMove
    CENTER = [1, 1]
    CORNERS = [ [0, 0], [0, 2], [2, 0], [2, 2] ]
    CARDINALS = [ [0, 1], [1, 0], [2, 1], [1, 2] ]

    def initialize(state)
      @state = state
    end

    def call
      winning_move || blocking_move || best_move
    end

    private

    def winning_move
      # Assumption here is that computer is always player 2
      partial_win_move(Grid::NOUGHT)
    end

    def blocking_move
      # Assumption here is that computer is always player 2
      partial_win_move(Grid::CROSS)
    end

    def partial_win_move(symbol)
      partial_win = result.partial_wins.find do |partial_win|
        partial_win[0] == symbol
      end

      partial_win && partial_win[1]
    end

    def result
      @_result ||= CheckResult.new(@state).call
    end

    def best_move
      if get_symbol(CENTER) == Grid::EMPTY
        CENTER
      elsif corner = CORNERS.find { |corner| get_symbol(corner) == Grid::EMPTY }
        corner
      elsif cardinal = CARDINALS.find { |cardinal| get_symbol(cardinal) == Grid::EMPTY }
        cardinal
      end
    end

    def get_symbol(spot)
      @state[spot[0]][spot[1]]
    end
  end
end
