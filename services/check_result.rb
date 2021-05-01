module TicTacToe
  class CheckResult
    attr_reader :winning_symbol

    def initialize(state)
      @state = state
      @winning_symbol = Grid::EMPTY
    end

    def call
      vertical_victory? || horizontal_victory? || diagonal_victory? || draw?
    end

    private

    def draw?
      !@state.flatten.any? { |x| x == Grid::EMPTY }
    end

    def vertical_victory?
      (0..2).any? do |x|
        equal_and_non_empty?(@state[x][0], @state[x][1], @state[x][2])
      end
    end

    def horizontal_victory?
      (0..2).any? do |y|
        equal_and_non_empty?(@state[0][y], @state[1][y], @state[2][y])
      end
    end

    def diagonal_victory?
      equal_and_non_empty?(@state[0][0], @state[1][1], @state[2][2]) ||
      equal_and_non_empty?(@state[0][2], @state[1][1], @state[2][0])
    end

    def equal_and_non_empty?(*values)
      values = values.uniq
      if values.count == 1 && values.first != Grid::EMPTY
        @winning_symbol = values.first
        true
      else
        false
      end
    end
  end
end
