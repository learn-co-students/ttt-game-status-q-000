# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

board = Array.new(9, " ")

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

# won? Method
def won?(board)
  WIN_COMBINATIONS.any? do |win_combo|
          if (board[win_combo[0]] == "X" || board[win_combo[0]] == "O") && board[win_combo[0]]== board[win_combo[1]] && board[win_combo[1]]==board[win_combo[2]]
          return win_combo
        else
          false
        end
    
   end
  false
end

#full? Method
def full?(board)
!board.any? do |location|
  location == " "
end
end

#draw? method
def draw?(board)
  !won?(board) ? true : false
end

#over? method
def over?(board)
  won?(board) || !draw?(board) || full?(board) ? true : false
end

#winner? method
def winner(board)
  
  if !won?(board)
    nil 

  elsif WIN_COMBINATIONS.any? {|win_combo| board[win_combo[0]] == "O"} ? true: false
  "O"
 
 else WIN_COMBINATIONS.any? {|win_combo| board[win_combo[0]] == "X"} ? true : false
  "X"

  end
end



