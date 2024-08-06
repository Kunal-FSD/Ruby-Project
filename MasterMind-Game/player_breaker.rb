# player_breaker.rb

require_relative 'common'

class PlayerBreaker
  include Common
  attr_accessor :player_input_code

  def initialize
    @player_input_code = []
  end

  def player_input_code
    @player_input_code = player_input
  end
end
