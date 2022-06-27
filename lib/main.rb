require_relative './board'
require_relative './game'
require_relative './player'

game = Game.new
game.create_player
game.create_player
board = game.create_board

until game.check_winner(game.players[game.current_player - 1])
  board.display_board
  puts "It's #{game.players[game.current_player].name} turn"
  game.play_round(game.players[game.current_player])
end

board.display_board
game.declare_winner(game.players[game.current_player - 1].name)
