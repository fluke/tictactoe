module TicTacToe
  class Grid
    EMPTY = '*'.freeze
    CROSS = 'X'.freeze
    NOUGHT = 'O'.freeze

    attr_accessor :state, :player1, :player2

    def initialize(player1, player2, state = default_grid)
      @player1 = player1
      @player2 = player2
      @state = state
    end

    # TODO fix usage
    def make_move(symbol, move)
      x, y = move
      service = CheckMoveValid.new(state, x, y, symbol)
      if service.call
        self.state[x][y] = symbol
        [:success]
      else
        [:error, { message: service.error_message } ]
      end
    end

    def to_s
      CreateGridStateString.new(state).call
    end

    def current_player
      flattened_state = @state.flatten
      num_crosses = flattened_state.count(Grid::CROSS)
      num_noughts = flattened_state.count(Grid::NOUGHT)

      num_crosses == num_noughts ? player1 : player2
    end

    protected

    def default_grid
      [
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY],
        [EMPTY, EMPTY, EMPTY],
      ]
    end
  end
end
