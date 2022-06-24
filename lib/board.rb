class Board

  attr_accessor :board, :board_border

  def initialize(row, column)
    @rows = row
    @columns = column
    @board = build_board
    @board_border = build_border
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

  def convert_move(letter, number) end

  def display_board() end
  
  def display_legal_moves() end
end

test = Board.new(3, 3)
test.board[0][1][2] = 'x'
puts test.board_border.join("")
puts test.board[0].join("")
puts test.board_border.join("")
puts test.board[1].join("")
puts test.board_border.join("")
puts test.board[2].join("")
puts test.board_border.join("")