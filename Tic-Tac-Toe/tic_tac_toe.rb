class TicTacToe
	def initialize(player1, player2)
		@board = Array.new(3){Array.new(3," ")}
		@current_player = player1
		@player1 = player1
		@player2 = player2
	end

	def play
		display_board
		loop do
			player_move
			display_board
			if winner?
				puts "#{@current_player.name} wins the game!!!"
				break
			elsif draw?
				puts "It's a tie, No one wins"
				break
			end
			switch_player
		end
	end

	def display_board
		puts " #{@board[0][0]} | #{@board[0][1]} | #{@board[0][2]} "
		puts "---+---+---"
		puts " #{@board[1][0]} | #{@board[1][1]} | #{@board[1][2]} "
		puts "---+---+---"
		puts " #{@board[2][0]} | #{@board[2][1]} | #{@board[2][2]} "
	end

	def player_move
		puts "#{@current_player.name}, enter your move (row and column): "
		move = gets.chomp
		row, col = move.split.map(&:to_i)
		if valid_move(row,col)
			@board[row][col] = @current_player.marker
		else
			puts "Invalid move, Please try again."
			player_move
		end
	end

	def valid_move(row, col)
		row.between?(0,2) && col.between?(0,2) && @board[row][col] == " "
	end

	def switch_player
		@current_player = @current_player == @player1 ? @player2 : @player1
	end

	def winner?
		lines = @board + @board.transpose + diagonals
		lines.any? { |line| line.uniq.size == 1 && line.first != " " }
	end

	def draw?
		@board.flatten.none? {|cell| cell == " "}
	end

	def diagonals
		[
			[@board[0][0], @board[1][1], @board[2][2]],
			[@board[0][2], @board[1][1], @board[2][0]]
		]
	end

end