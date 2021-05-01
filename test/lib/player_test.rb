require "minitest/autorun"
Dir[File.expand_path('../../../lib/*.rb', __FILE__)].each { |file| require file }

class PlayerTest < Minitest::Test
  def setup
    @player = ::TicTacToe::Player.new("Kartik", ::TicTacToe::Grid::CROSS)
  end

  def test_player_fields
    assert_equal "Kartik", @player.name
    assert_equal ::TicTacToe::Grid::CROSS, @player.symbol
  end
end
