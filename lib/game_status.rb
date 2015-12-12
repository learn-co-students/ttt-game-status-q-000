# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[6,4,2],[0,4,8],]
# match  positions:  1,2,3   4,5,6   7,8,9   1,4,7   2,5,8   3,6,9   7,5,3   1,5,9
# # Your #won? method should accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win.
def won?(board)
  # for each win_combination in WIN_COMBINATIONS
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  #def win_combination(position)
win_combination = WIN_COMBINATIONS

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]
  win_index_4 = win_combination[3]
  win_index_5 = win_combination[4]
  win_index_6 = win_combination[5]
  win_index_7 = win_combination[6]
  win_index_8 = win_combination[7]

  position_1 = board[0] # load the value of the board at win_index_1
  position_2 = board[1] # load the value of the board at win_index_2
  position_3 = board[2] # load the value of the board at win_index_3
  position_4 = board[3] # load the value of the board at win_index_4
  position_5 = board[4] # load the value of the board at win_index_5
  position_6 = board[5] # load the value of the board at win_index_6
  position_7 = board[6] # load the value of the board at win_index_7
  position_8 = board[7] # load the value of the board at win_index_8
  position_9 = board[8] # load the value of the board at win_index_9

  if    position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination[0] # return the win_combination indexes that won.
  elsif position_4 == "X" && position_5 == "X" && position_6 == "X"
    return win_combination[1] # return the win_combination indexes that won.
  elsif position_7 == "X" && position_8 == "X" && position_9 == "X"
    return win_combination[2] # return the win_combination indexes that won.
  elsif position_1 == "X" && position_4 == "X" && position_7 == "X"
    return win_combination[3] # return the win_combination indexes that won.
  elsif position_2 == "X" && position_5 == "X" && position_8 == "X"
    return win_combination[4] # return the win_combination indexes that won.
  elsif position_3 == "X" && position_6 == "X" && position_9 == "X"
    return win_combination[5] # return the win_combination indexes that won.
  elsif position_7 == "X" && position_5 == "X" && position_3 == "X"
    return win_combination[6] # return the win_combination indexes that won.
  elsif position_1 == "X" && position_5 == "X" && position_9 == "X"
    return win_combination[7] # return the win_combination indexes that won.
  
  elsif    position_1 == "O" && position_2 == "O" && position_3 == "O"
    return win_combination[0] # return the win_combination indexes that won.
  elsif position_4 == "O" && position_5 == "O" && position_6 == "O"
    return win_combination[1] # return the win_combination indexes that won.
  elsif position_7 == "O" && position_8 == "O" && position_9 == "O"
    return win_combination[2] # return the win_combination indexes that won.
  elsif position_1 == "O" && position_4 == "O" && position_7 == "O"
    return win_combination[3] # return the win_combination indexes that won.
  elsif position_2 == "O" && position_5 == "O" && position_8 == "O"
    return win_combination[4] # return the win_combination indexes that won.
  elsif position_3 == "O" && position_6 == "O" && position_9 == "O"
    return win_combination[5] # return the win_combination indexes that won.
  elsif position_7 == "O" && position_5 == "O" && position_3 == "O"
    return win_combination[6] # return the win_combination indexes that won.
  elsif position_1 == "O" && position_5 == "O" && position_9 == "O"
    return win_combination[7] # return the win_combination indexes that won.
  else
    false
  end
end


# The #full? method should accept a board and return true if every element in the board contains either an "X" or an "O". 
def full?(board)
    if board.each.detect{|i| i == " "} 
      false
    else board.each.detect{|i| i != " "} && won?(board) == false
      true
    end
end
# Build a method #draw? that accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won. You should be able to compose this method solely using the methods you used above with some ruby logic.
def draw?(board)
    if  (full?(board) == true) && (won?(board) == false)
      true
    else (full?(board) == false) && (won?(board) == false)
  end
end


#OVER?
# Build a method #over? that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.
def over?(board)
    if won?(board) != false
      true
    elsif draw?(board) == false
    else full?(board) == true
  end
end


#WINNER
# The #winner method should accept a board and return the token, "X" or "O" that has won the game given a winning board.
# The #winner method can be greatly simplified by using the methods and their return values you defined above.

def winner(board)
  if draw?(board) == false
    i = won?(board)
    h = i[0]
    return board[h]
  else
  end
end
