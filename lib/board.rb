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

  def change(row, column, piece)
    @board[row][column][2] = piece
  end

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

  def board_to_move(first, second)
    "#{LETTERS[first]}#{second + 1}"
  end

  def display_board
    puts " #{@letter_array.join('')}"
    @rows.times do |time|
      puts "  #{@board_border.join('')}"
      puts "#{time + 1} #{@board[time].join('')}"
    end
    puts "  #{@board_border.join('')}"
  end

  def display_legal_moves
    moves = ''
    @rows.times do |row|
      @columns.times do |column|
        unless @board[row][column][2] != ' '
          moves +=
            "#{board_to_move(column, row)} "
        end
      end
    end
    moves
  end

  def check_vertical(piece)
    @columns.times do |column|
      if @board[0][column][2] == piece &&
         @board[1][column][2] == piece &&
         @board[2][column][2] == piece
        return true
      else
        next
      end
    end
    false
  end

  def check_horizontal(piece)
    @rows.times do |row|
      if @board[row][0][2] == piece &&
         @board[row][1][2] == piece &&
         @board[row][2][2] == piece
        return true
      else
        next
      end
    end
    false
  end

  def check_diagonal(piece)
    if (@board[0][0][2] == piece &&
        @board[1][1][2] == piece &&
        @board[2][2][2] == piece) ||
       (@board[2][0][2] == piece &&
        @board[1][1][2] == piece &&
        @board[0][2][2] == piece)
      return true
    end

    false
  end

  def check_tie
    @rows.times do |row|
      @columns.times do |column|
        if @board[row][column][2] == ' '
          return false
        else
          next
        end
      end
    end
    true
  end
end
