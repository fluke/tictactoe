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
  end
end
