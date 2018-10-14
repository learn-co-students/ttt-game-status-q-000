# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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

# def won?(board)
#   WIN_COMBINATIONS.find do |win_index|
#     board[win_index].each |location|
#       position_taken?(board, location)
#       &&
#         (board[win_index].all {|location| location = "X"}
#           ||boar)
#         }
#         }
#       end
#     end
#   end
# end

# def won?(board)
#   WIN_COMBINATIONS.find do |win_combination|
    
#     board[win_combination].all? {|win_index| win_index == "X"} || board[win_combination].all? {|win_index| win_index == "O"}

#     board[]


#   end
# end

# board = ["X","X","X"," "," "," "," "," "," "]
# board[WIN_COMBINATION[1]].each 

# for each win_combination in WIN_COMBINATIONS
#   # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
#   # grab each index from the win_combination that composes a win.
#   win_index_1 = win_combination[0]
#   win_index_2 = win_combination[1]
#   win_index_3 = win_combination[2]

#   position_1 = board[win_index_1] # load the value of the board at win_index_1
#   position_2 = board[win_index_2] # load the value of the board at win_index_2
#   position_3 = board[win_index_3] # load the value of the board at win_index_3

#   if position_1 == "X" && position_2 == "X" && position_3 = "X"
#     return win_combination # return the win_combination indexes that won.
#   else
#     false
#   end
# end

# def won?(board)
#   WIN_COMBINATIONS.find do |win_combination|
#     win_combination.each do |win_index| 
#         board[win_index].all? {|position| position == "X"} || board[win_index].all? {|position| position == "O"})
#     end
#   end
# end

# def won?(board)
#   WIN_COMBINATIONS.find {|win_combination| win_combination.each {|win_index| board[win_index].all? {|position| position == "X"} || board[win_index].all? {|position| position == "O"}}}
# end

# CLOSE, but returns win as long as all of the positions in the index are filled in, rather than actually seeing if they match each other
# def won?(board)
#   WIN_COMBINATIONS.find {|win_combination| win_combination.all? {|win_index| board[win_index] == "X" || board[win_index] == "O"}}
# end

# def won?(board)
#   WIN_COMBINATIONS.find 
#     {|win_combination| win_combination.all? {|win_index| board[win_index] == "X"}} || {|win_combination| win_combination.all? {|win_index| board[win_index] == "O"}}
# end

# WIN_COMBINATIONS.find 
#   {|win_combination| win_combination.all? 
#     {|win_index| board[win_index] == "X" || board[win_index] == "O"}
#   }

def won?(board)
  WIN_COMBINATIONS.find {|win_combination| win_combination.all? {|win_index| board[win_index] == "X"} || win_combination.all? {|win_index| board[win_index] == "O"}}
end

# couldn't figure out how to call #position_taken? in this one...
def full?(board)
  board.all? {|position_contents| !(position_contents.nil? || position_contents == " ")}
end

def draw?(board)
  if won?(board) == nil && full?(board) == true
    true
  else
    false 
  end
end

def over?(board)
  if won?(board) != nil || full?(board) == true || draw?(board) == true
    true
  else
    false
  end
end

def winner(board)
  if won?(board) != nil
    winning_board = won?(board)
    return board[winning_board[0]]
  else
    nil
  end
end

