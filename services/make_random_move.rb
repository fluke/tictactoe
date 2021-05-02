module TicTacToe
  class MakeRandomMove
    def initialize(state)
      @state = state
    end

    def call
      empty_spots = find_all_empty_spots
      empty_spots.sample
    end

    private

    def find_all_empty_spots
      [].tap do |empty_spots|
        (0..2).each do |x|
          (0..2).each do |y|
            empty_spots << [x, y] if @state[x][y] == Grid::EMPTY
          end
        end
      end
    end
  end
end
