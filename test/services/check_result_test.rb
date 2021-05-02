require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }
Dir[File.expand_path('../../../services/*.rb', __FILE__)].each { |file| require file }

class CheckResultTest < Minitest::Test
  def test_returns_in_progress_if_not_complete
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :in_progress, check_result.status
    assert_nil check_result.winning_symbol
  end

  def test_returns_partial_if_not_complete
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :partial, check_result.status
    assert_equal [ [::TicTacToe::Grid::CROSS, [2, 0]] ], check_result.partial_wins

    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :partial, check_result.status
    assert_equal [ [::TicTacToe::Grid::NOUGHT, [0, 0]], [::TicTacToe::Grid::CROSS, [0, 0]] ], check_result.partial_wins
  end

  def test_returns_complete_if_vertical_victory
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :complete, check_result.status
    assert_equal ::TicTacToe::Grid::CROSS, check_result.winning_symbol
  end

  def test_returns_complete_if_horizontal_victory
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :complete, check_result.status
    assert_equal ::TicTacToe::Grid::NOUGHT, check_result.winning_symbol
  end

  def test_returns_complete_if_diagonal_victory
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::EMPTY],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::EMPTY, ::TicTacToe::Grid::CROSS]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :complete, check_result.status
    assert_equal ::TicTacToe::Grid::CROSS, check_result.winning_symbol
  end

  def test_returns_complete_if_draw
    grid = ::TicTacToe::Grid.new(
      [
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS],
        [::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::NOUGHT],
        [::TicTacToe::Grid::NOUGHT, ::TicTacToe::Grid::CROSS, ::TicTacToe::Grid::CROSS]
      ]
    )

    check_result = ::TicTacToe::CheckResult.new(grid.state)
    check_result.call

    assert_equal :complete, check_result.status
    assert_nil check_result.winning_symbol
  end
end
