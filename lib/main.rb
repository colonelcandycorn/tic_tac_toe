require_relative './board'
require_relative './game'
require_relative './player'

game = Game.new
game.create_player
game.create_player
board = game.create_board

until game.check_winner(game.players[game.current_player - 1]) || board.check_tie
  board.display_board
  puts "It's #{game.players[game.current_player].name} turn"
  game.play_round(game.players[game.current_player])
end

board.display_board
game.declare_tie if board.check_tie
board.declare_winner(game.players[game.current_player]) if game.check_winner(game.players[game.current_player])

# This is the end of the program.
# The rest of the code is in the files board.rb, game.rb, and player.rb.
