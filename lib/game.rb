class Game 
  require_relative './board'
  require_relative './player'

  attr_accessor :players, :board, :current_player

  def initialize
    @current_player = 0
    @winner = false
    @players = []
    @board = []
    @available_pieces = %w[x o]
  end

  def create_player
    puts 'Please select a name for Player'
    name = gets.chomp
    player = Player.new(name, @available_pieces.pop)
    @players << player
    player
  end

  def create_board
    board = Board.new(3, 3)
    @board << board
    board
  end

  def play_round(player)
    move = player.choose_move
    if @board[0].display_legal_moves.include?(move)
      move = @board[0].convert_move(move)
      @board[0].change(move[1], move[0], player.piece)
      @current_player = @current_player.zero? ? 1 : 0
    else
      puts 'Invalid move'
      play_round(player)
    end
  end

  def check_winner(player)
    if @board[0].check_diagonal(player.piece) ||
       @board[0].check_horizontal(player.piece) ||
       @board[0].check_vertical(player.piece)
      return true
    end

    false
  end

  def declare_winner(player)
    puts "#{player} is the big winner today!"
  end
end
