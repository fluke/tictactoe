require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class CheckResultTest < Minitest::Test
  def test_returns_false_if_not_complete
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    assert_equal false,
      ::TicTacToe::CheckResult.new(@grid.state).call
  end

  def test_returns_true_if_vertical_victory
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    assert_equal true,
      ::TicTacToe::CheckResult.new(@grid.state).call
  end

  def test_returns_true_if_horizontal_victory
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    assert_equal true,
      ::TicTacToe::CheckResult.new(@grid.state).call
  end

  def test_returns_true_if_diagonal_victory
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS]
      ]
    )

    assert_equal true,
      ::TicTacToe::CheckResult.new(@grid.state).call
  end

  def test_returns_true_if_draw
    @grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::CROSS],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT]
      ]
    )

    assert_equal true,
      ::TicTacToe::CheckResult.new(@grid.state).call
  end
end
