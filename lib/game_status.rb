require 'pry'
# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #Top row
  [3,4,5], #Middle row
  [6,7,8], #Bottom row
  [0,3,6], #Left column
  [1,4,7], #Middle column
  [2,5,8], #Right column
  [0,4,8], #Diagnal l-r
  [2,4,6], #Diagnal r-l
]



def won?(board)
  # board = ["X", "X", "X", "X", " ", "X", "X", "O", "O"]
  the_winning_combo = nil
  
  # if all the values in a win combo have the same character, X, O, in the board, then someone has won

  # for each index in a win combo 
  WIN_COMBINATIONS.each do |win_combo|
  # win_combo = [0,1,2]
  # i need to check that value in the board
    first_index = win_combo[0]
    second_index = win_combo[1]
    third_index = win_combo[2]

    token_1 = board[first_index]
    token_2 = board[second_index]
    token_3 = board[third_index]

    if token_1 == "X" && token_2 == "X" && token_3 == "X"
      the_winning_combo = win_combo
    elsif token_1 == "O" && token_2 == "O" && token_3 == "O"
      # IF WERE HERE, WE KNOW WIN_COMBO IS WHAT WE NEED TO RETURN
      # return win_combo
      the_winning_combo = win_combo
    end
  end

  # win_combo where it's [0,1,2]
  return the_winning_combo
end

def full?(board)
  # board = ["X", "X", "X", "X", " ", "X", "X", "O", "O"]
  no_empty_spaces = true
#if every position is taken 
  board.each do |token|
    if token == " " 
      no_empty_spaces = false
    end
  end
  return no_empty_spaces
end

def draw?(board)
  # if no one has one and board is full 
  if !won?(board) == true && full?(board) == true
    true
  else false
  end
end

def over?(board)
  #if game has been won
  #if board is full
  #if draw

  if won?(board) == true || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  #a = a || b
  #winning = nil
  #winning_combo ||= won?(board) // or-equals, setDefault
  #winning_combo.nil? ? board[winning_combo.first] : nil // ternary
  winning_combo = won?(board)
  board[winning_combo.first] unless winning_combo.nil?
end
