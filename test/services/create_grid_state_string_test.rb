require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class CreateGridStateStringTest < Minitest::Test
  def test_default_grid_to_string
    grid1 = ::TicTacToe::Grid.new
    grid_string = ::TicTacToe::CreateGridStateString.new(grid1.state).call
    assert_equal(
      "***\n***\n***\n",
      grid_string
    )
  end

  def test_making_move_changes_state
    grid2 = ::TicTacToe::Grid.new
    grid2.make_move(1, 1, ::TicTacToe::Grid::CROSS)
    grid_string = ::TicTacToe::CreateGridStateString.new(grid2.state).call
    assert_equal(
      "***\n*X*\n***\n",
      grid_string
    )
  end
end
