require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class MakeOptimalMoveTest < Minitest::Test
  def test_returns_a_center_move_if_empty_if_no_winning_move
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    move = ::TicTacToe::MakeOptimalMove.new(grid.state).call
    assert_equal ::TicTacToe::MakeOptimalMove::CENTER, move
  end

  def test_returns_a_corner_move_if_center_filled_and_no_winning_move
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    move = ::TicTacToe::MakeOptimalMove.new(grid.state).call
    assert ::TicTacToe::MakeOptimalMove::CORNERS.include?(move)
  end

  def test_returns_a_cardinal_move_if_center_and_corners_filled_and_no_winning_move
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::NOUGHT]
      ]
    )

    move = ::TicTacToe::MakeOptimalMove.new(grid.state).call
    assert ::TicTacToe::MakeOptimalMove::CARDINALS.include?(move)
  end
end
