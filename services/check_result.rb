module TicTacToe
  class CheckResult
    attr_reader :status, :winning_symbol, :partial_wins

    def initialize(state)
      @state = state
      @status = :in_progress
      @winning_symbol = nil
      @partial_wins = []
    end

    def call
      check_vertical
      check_horizontal
      check_diagonal
      check_draw

      self
    end

    private

    def check_draw
      if !@state.flatten.any? { |x| x == Grid::EMPTY }
        @status = :complete
      end
    end

    def check_vertical
      (0..2).each do |x|
        check_triplet([ [x, 0], [x, 1], [x, 2] ])
      end
    end

    def check_horizontal
      (0..2).each do |y|
        check_triplet([ [0, y], [1, y], [2, y] ])
      end
    end

    def check_diagonal
      check_triplet([ [0, 0], [1, 1], [2, 2] ])
      check_triplet([ [0, 2], [1, 1], [2, 0] ])
    end

    def check_triplet(spots)
      if symbol = victory?(spots)
        @status = :complete
        @winning_symbol = symbol
      elsif partial = partial_victory?(spots)
        @status = :partial unless @status == :complete
        @partial_wins << partial
      end
    end

    def victory?(spots)
      values = spots.map { |s| get_value(s) }.uniq
      (values.count == 1 && values.first != Grid::EMPTY) ? values.first : nil
    end

    def partial_victory?(spots)
      values = spots.map { |s| get_value(s) }
      if values.count(Grid::EMPTY) == 1
        empty_spot = spots[values.index(Grid::EMPTY)]
        if values.count(Grid::CROSS) == 2
          [Grid::CROSS, empty_spot]
        elsif values.count(Grid::NOUGHT) == 2
          [Grid::NOUGHT, empty_spot]
        end
      end
    end

    def get_value(spot)
      @state[spot[0]][spot[1]]
    end
  end
end
