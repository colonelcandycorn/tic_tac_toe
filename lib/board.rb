class Board
  attr_accessor :board, :board_border

  LETTERS = Array('a'..'z')

  def initialize(row, column)
    @rows = row
    @columns = column
    @board = build_board
    @board_border = build_border
    @letter_array = build_letters
  end

  def change(row, column, piece) end

  def build_board
    game_array = []
    @rows.times do
      game_array.push(Array.new(@columns) { ['|', ' ', ' ', ' '] }.push('|'))
    end
    game_array
  end

  def build_border
    Array.new(@columns) { ['+', '-', '-', '-'] }.push('+')
  end

  def build_letters
    letter_array = []
    @rows.times do |time|
      letter_array.push("   #{LETTERS[time]}")
    end
    letter_array
  end

  def convert_move(move)
    move_array = move.strip.split('')
    move_array[0] = LETTERS.index(move_array[0])
    move_array[1] = move_array[1].to_i - 1
    move_array
  end

  def display_board
    puts " #{@letter_array.join('')}"
    @rows.times do |time|
      puts "  #{@board_border.join('')}"
      puts "#{time + 1} #{@board[time].join('')}"
    end
    puts "  #{@board_border.join('')}"
  end

  def display_legal_moves() end
end
