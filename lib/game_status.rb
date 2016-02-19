# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Vertical row 0,3,6
  [1,4,7], #Vertical row 1,4,5
  [2,5,8], #Vertical row 2,5,8
  [0,4,8], #Diagonal line 0,4,8
  [2,4,6]  #Diagonal line 2,4,6
  ]

def won?(board)
    answer = case
    when board[WIN_COMBINATIONS[0][0]] == "X" && board[WIN_COMBINATIONS[0][1]] == "X" && board[WIN_COMBINATIONS[0][2]] == "X"
    return WIN_COMBINATIONS[0]

    when board[WIN_COMBINATIONS[1][0]] == "X" && board[WIN_COMBINATIONS[1][1]] == "X" && board[WIN_COMBINATIONS[1][2]] == "X"
    return WIN_COMBINATIONS[1]

    when board[WIN_COMBINATIONS[2][0]] == "X" && board[WIN_COMBINATIONS[2][1]] == "X" && board[WIN_COMBINATIONS[2][2]] == "X"
    return WIN_COMBINATIONS[2]

    when board[WIN_COMBINATIONS[3][0]] == "O" && board[WIN_COMBINATIONS[3][1]] == "O" && board[WIN_COMBINATIONS[3][2]] == "O"
    return WIN_COMBINATIONS[3]

    when board[WIN_COMBINATIONS[4][0]] == "O" && board[WIN_COMBINATIONS[4][1]] == "O" && board[WIN_COMBINATIONS[4][2]] == "O"
    return WIN_COMBINATIONS[4]

    when board[WIN_COMBINATIONS[5][0]] == "O" && board[WIN_COMBINATIONS[5][1]] == "O" && board[WIN_COMBINATIONS[5][2]] == "O"
    return WIN_COMBINATIONS[5]

    when board[WIN_COMBINATIONS[6][0]] == "X" && board[WIN_COMBINATIONS[6][1]] == "X" && board[WIN_COMBINATIONS[6][2]] == "X"
    return WIN_COMBINATIONS[6]

    when board[WIN_COMBINATIONS[7][0]] == "O" && board[WIN_COMBINATIONS[7][1]] == "O" && board[WIN_COMBINATIONS[7][2]] == "O"
    return WIN_COMBINATIONS[7]

    end
end

#full? method
def full?(board)
  if board.include?(" ")
    false
  else
   true
  end
end

#draw? method
def draw?(board)
  if won?(board) == nil
    return true
  else
    return false
  end
end

#over? method
def over?(board)
   answer = case
   when full?(board) == false
    return false
   when draw?(board) || won?(board)
    return true
  end
end

def winner(board)
  if won?(board) !=nil
  a = won?(board)
  b = board[a.first]
  return b
  else
  return nil
  end
end