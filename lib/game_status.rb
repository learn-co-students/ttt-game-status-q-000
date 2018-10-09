# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2],
]

def display_board(board)
  dash = "-" * 11
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts dash
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts dash
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def move(board, position, char="X")
  board[position.to_i-1] = char
end

def position_taken?(board, position)
  board[position] != " " && board[position] != ""
end

def valid_move?(board, position)
  position.to_i.between?(1,9) && !position_taken?(board, position.to_i-1)
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  if valid_move?(board, input)
    move(board, input)
  else
    turn(board)
  end
  display_board(board)
end

def turn_count(board)
  board.join('').scan(/[XO]/).count
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

def won?(board)
  return false if board.all? {|x| x == " " || x.nil?}

  WIN_COMBINATIONS.each do |win_combination|
    index_1 = win_combination[0]
    index_2 = win_combination[1]
    index_3 = win_combination[2]

    pos_1 = board[index_1]
    pos_2 = board[index_2]
    pos_3 = board[index_3]

    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return win_combination
    else
      false
    end
  end
  false
end

def full?(board)
  turn_count(board) == 9 && !won?(board)
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end
