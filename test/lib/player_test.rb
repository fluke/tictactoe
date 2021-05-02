require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }

class PlayerTest < Minitest::Test
  def setup
    @player = ::TicTacToe::Player.new(name: "Kartik", symbol: ::TicTacToe::Grid::CROSS, computer: false)
  end

  def test_player_fields
    assert_equal "Kartik", @player.name
    assert_equal ::TicTacToe::Grid::CROSS, @player.symbol
    assert_equal false, @player.computer
  end
end
