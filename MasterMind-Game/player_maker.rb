# player_maker.rb

require_relative 'common'

class PlayerMaker
  include Common
  attr_accessor :player_input_code, :ai_input_code

  def initialize
    @player_input_code = []
    @ai_input_code = []
  end

  def player_input_code
    @player_input_code = player_input
  end

  def first_guess
    value = Common::RANGE.sample
    i = 1
    while i <= 4 do
      @ai_input_code << value
      i += 1
    end
    puts "Computer guessed: #{@ai_input_code}"
  end

  def solve
    new_guess = []
    i = 0
    while i <= 3
      if @player_input_code[i] == @ai_input_code[i]
        new_guess << @player_input_code[i]
      else
        value = Common::RANGE.sample
        new_guess << value
      end
      i += 1
    end
    @ai_input_code = new_guess
    puts "Computer guessed: #{@ai_input_code}"
  end
end
