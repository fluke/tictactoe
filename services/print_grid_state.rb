module TicTacToe
  class PrintGridState
    def initialize(state)
      @state = state
    end

    def call
      (0..2).each do |x|
        (0..2).each do |y|
          print @state[x][y]
        end
        puts
      end
    end
  end
end
