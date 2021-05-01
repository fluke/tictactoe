module TicTacToe
  class Grid
    EMPTY = '*'.freeze
    CROSS = 'X'.freeze
    NOUGHT = 'O'.freeze

    DEFAULT = [
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY],
      [EMPTY, EMPTY, EMPTY]
    ]

    attr_accessor :state

    def initialize(state = DEFAULT)
      @state = state
    end

    def print
      PrintGridState.new(@state).call
    end

    def make_move(x, y, symbol)
      @state[x][y] = symbol
    end
  end
end
