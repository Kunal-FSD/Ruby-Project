require_relative 'tic_tac_toe'
require_relative 'player'

player1 = Player.new("Bob", "X")
player2 = Player.new("Josh", "O")

game = TicTacToe.new(player1, player2)
game.play