# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS
WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,4,8],
  [6,4,2],
  [0,3,6],
  [1,4,7],
  [2,5,8]
]

def won?(board)
  WIN_COMBINATIONS.detect do |wc|
    p1 = board[wc[0]]
    p2 = board[wc[1]]
    p3 = board[wc[2]]
    if (p1 == "X" && p2 == "X" && p3 == "X") || (p1 == "O" && p2 == "O" && p3 == "O")
      return [wc[0], wc[1], wc[2]]
    end
  end
  return false
end

def full?(board)
  board.none? { |element| element == " " }
end

def draw?(board)
  win = won?(board).is_a?(Array)
  if win && full?(board)
    false
  elsif full?(board)
    true
  else
    false
  end
end

def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board).is_a?(Array)
    combo = won?(board)
    return "O" if board[combo[0]] == "O"
    return "X" if board[combo[0]] == "X"
  else
  end
end

