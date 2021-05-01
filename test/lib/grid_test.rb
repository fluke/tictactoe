require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class GridTest < Minitest::Test
  def test_default_state_is_all_spots_are_empty
    grid1 = ::TicTacToe::Grid.new
    assert_equal(
      [
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ],
      grid1.state
    )
  end

  def test_making_move_changes_state
    grid2 = ::TicTacToe::Grid.new
    grid2.make_move(1, 1, ::TicTacToe::Grid::CROSS)
    assert_equal(
      [
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ],
      grid2.state
    )
  end
end
