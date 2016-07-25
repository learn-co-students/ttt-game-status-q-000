# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |comb|
    if (board[comb[0]] == board[comb[1]] && board[comb[1]]== board[comb[2]] && board[comb[0]] != " ")
      return [comb[0], comb[1], comb[2]]
    end
  end
  return false
end

def full?(board)
  return true if (board.include?(" ") == false)
  false
end

def draw?(board)
  return true if full?(board) == true && won?(board) == false
  false
end

def over?(board)
  return (draw?(board)  || full?(board) || won?(board) )
end

def winner(board)
  WIN_COMBINATIONS.each do |comb|
    return "X" if (board[comb[0]] == board[comb[1]] && board[comb[1]]== board[comb[2]] && board[comb[0]] == "X")
    return "O" if (board[comb[0]] == board[comb[1]] && board[comb[1]]== board[comb[2]] && board[comb[0]] == "O")
  end
  return nil
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
