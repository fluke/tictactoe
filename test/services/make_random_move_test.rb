require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class MakeRandomMoveTest < Minitest::Test
  def setup
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )
  end

  def test_returns_a_move_corresponding_to_an_empty_spot
    move = ::TicTacToe::MakeRandomMove.new(@grid.state).call
    assert [ [1,2], [2,0], [2,1], [2, 2] ].include?(move)
  end
end
