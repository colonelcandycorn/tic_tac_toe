class Player
  attr_accessor :name, :piece

  def initialize(name, piece)
    @name = name
    @piece = piece
    @score = 0
  end

  def choose_move
    puts 'Please select a move'
    move = gets.chomp
    nil unless move.match(/^[a-z]\d$/)
    move
  end
end
