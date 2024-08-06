# game.rb

require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new
  end

  def play_again
    puts 'Enter Y to play again or N to end.'
    answer = gets.chomp
    case answer
    when 'Y', 'y'
      @board = Board.new
      @board.decide_play_method
      play_again
    else
      puts 'Thanks for playing!'
    end
  end
end
