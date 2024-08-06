# common.rb

module Common
  RANGE = ['1', '2', '3', '4', '5', '6']

  def player_input
    puts 'Enter your code: four numbers (1 through 6) in a row on one line'
    input = gets.chomp
    input_ascii = input.each_byte.to_a
    until input.length == 4 && input_ascii.all? { |e| e >= 49 && e <= 54 }
      puts 'Make sure you have entered a valid code!'
      input = gets.chomp
      input_ascii = input.each_byte.to_a
    end
    input.split('')
  end
end
