module TicTacToe
  class PrintGridState
    def initialize(state)
      @state = state
    end

    def call
      (2).downto(0).each do |y|
        (0..2).each do |x|
          print @state[x][y]
        end
        puts
      end
    end
  end
end
