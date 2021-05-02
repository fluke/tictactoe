module TicTacToe
  class Grid
    EMPTY = '*'.freeze
    CROSS = 'X'.freeze
    NOUGHT = 'O'.freeze

    attr_accessor :state

    def initialize(
      state = [
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY]
      ]
    )
      @state = state
    end

    def to_s
      CreateGridStateString.new(@state).call
    end

    def make_move(x, y, symbol)
      service = CheckMoveValid.new(@state, x, y, symbol)
      if service.call
        @state[x][y] = symbol
        true
      else
        puts service.error_message
        false
      end
    end
  end
end
