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
