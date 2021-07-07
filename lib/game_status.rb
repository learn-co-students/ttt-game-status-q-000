# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [ [0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]
  ]

def won?(board)

  WIN_COMBINATIONS.each do |win_comb|

    pos1 = board[win_comb[0]]
    pos2 = board[win_comb[1]]
    pos3 = board[win_comb[2]]

    return win_comb if pos1 == "X" && pos2 == "X" && pos3 == "X"
    return win_comb if pos1 == "O" && pos2 == "O" && pos3 == "O"
  end
  return false
end

def full?(board)
  board.all? do |str|
    str == "O" || str == "X"
  end
end

def draw?(board)
  return true if full?(board) == true && won?(board) == false
end

def over?(board)
  return true if full?(board) == true || won?(board) == true || draw?(board) == true
end

def winner(board)
  if win_pos = won?(board)
    if board[win_pos[0]] == "X"
      return "X"
    end
    if board[win_pos[0]] == "O"
      return "O"
    end
  end
end
