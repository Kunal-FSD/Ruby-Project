# board.rb

require_relative 'common'
require_relative 'player_breaker'
require_relative 'player_maker'

class Board
  include Common
  attr_accessor :maker_board, :turn_count, :breaker

  def initialize
    @maker_board = []
    @breaker_board = []
    @winner = false
    @match = 0
    @partial = 0
    @player_breaker = PlayerBreaker.new
    @player_maker = PlayerMaker.new
    puts 'Enter 1 to be the code breaker or 2 to be the code maker.'
    @player_choice = gets.chomp
    @turn_count = 1
  end

  def player_is_breaker
    @breaker_board = @player_breaker.player_input_code
  end

  def player_is_maker
    @maker_board = @player_maker.player_input_code
    @breaker_board = @player_maker.ai_input_code
  end

  def computer_maker
    i = 1
    while i <= 4 do
      value = Common::RANGE.sample
      @maker_board << value
      i += 1
    end
  end

  def check_winner
    if @maker_board == @breaker_board
      @turn_count = 13
      @winner = true
    end
  end

  def check_match_partial
    @match = 0
    @partial = 0
    @maker_board.each_with_index do |a, i|
      @breaker_board.each_with_index do |b, j|
        if a == b && i == j
          @match += 1
        elsif a == b && i != j
          @partial += 1
        end
      end
    end
    puts "Match: #{@match}"
    puts "Partial: #{@partial}"
    puts "\r\n"
  end

  def result
    case @player_choice
    when '1'
      if @winner
        puts 'Congratulations, you solved it!'
      else
        puts "The code was #{@maker_board.join}. Better luck next time!"
      end
    else
      if @winner
        puts 'The machine figured out your code!'
      else
        puts 'You beat the machine!'
      end
    end
  end

  def decide_play_method
    case @player_choice
    when '1'
      play_player_breaker
    else
      play_player_maker
    end
  end

  def play_player_breaker
    computer_maker
    until @turn_count >= 13
      puts "Turn: #{@turn_count}"
      @player_breaker.player_input
      player_is_breaker
      check_winner
      check_match_partial
      @turn_count += 1
    end
    result
  end

  def play_player_maker
    @player_maker.player_input
    @player_maker.first_guess
    check_match_partial
    @turn_count += 1
    until @turn_count >= 13
      puts "Turn: #{@turn_count}"
      @player_maker.solve
      player_is_maker
      check_winner
      check_match_partial
      @turn_count += 1
      sleep(1)
    end
    result
  end
end
