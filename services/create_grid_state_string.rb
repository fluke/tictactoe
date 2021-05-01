# The grid follows the usual X and Y axis grid. Like follows:
# 2  * * *
# 1  * * *
# 0  * * *
# Y
#  X 0 1 2

module TicTacToe
  class CreateGridStateString
    def initialize(state)
      @state = state
    end

    def call
      grid_string = ""

      (2).downto(0).each do |y|
        (0..2).each do |x|
          grid_string += @state[x][y]
        end
        grid_string += "\n"
      end

      grid_string
    end
  end
end
