# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

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
  return true if board.all? {|x| x == "X" || x == "O"} && !won?(board)
  false
end

def draw?(board)
  return true if !won?(board) && full?(board)
  false
end

def over?(board)
  return true if won?(board) || draw?(board) || full?(board)
  false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

if __FILE__ == $0 
  board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

  puts full?(board)
end
