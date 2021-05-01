require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class CheckMoveValidTest < Minitest::Test
  def setup
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )
  end

  def test_returns_true_if_move_is_valid
    assert_equal true,
      ::TicTacToe::CheckMoveValid.new(@grid.state, 2, 2, ::TicTacToe::Grid::CROSS).call
  end

  def test_returns_false_if_coordinates_are_invalid
    assert_equal false,
      ::TicTacToe::CheckMoveValid.new(@grid.state, 20, 20, ::TicTacToe::Grid::CROSS).call
  end

  def test_returns_false_if_space_is_already_occupied
    assert_equal false,
      ::TicTacToe::CheckMoveValid.new(@grid.state, 0, 0, ::TicTacToe::Grid::CROSS).call
  end
end
