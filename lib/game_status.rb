# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
  if !board.include?("X") && !board.include?("O")
    return false
  end

  WIN_COMBINATIONS.each do |winning_line|
    player = board[winning_line[0]]
    if player != " " && (board[winning_line[0]] == board[winning_line[1]]) && (board[winning_line[1]] == board[winning_line[2]])
      return winning_line.to_a
    end
  end

  return false
end

def full?(board)
  return !board.include?(" ")     # If board has at least one ' ', it is not full
end

def draw?(board)
  if !full?(board)
    return false
  end

  WIN_COMBINATIONS.each do |winning_line|
    if board[winning_line[0]] != " " && (board[winning_line[0]] == board[winning_line[1]]) && (board[winning_line[1]] == board[winning_line[2]])
      return false
    end
  end

  return true
end

def over?(board)
  if draw?(board) || full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |winning_line|
    if board[winning_line[0]] != " " && (board[winning_line[0]] == board[winning_line[1]]) && (board[winning_line[1]] == board[winning_line[2]])
      return board[winning_line[0]].to_s
    end
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
