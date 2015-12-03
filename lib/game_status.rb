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
                      [6,4,2] 
                    ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return win_combination # return the win_combination indexes that won.
    end
  end
  false
end

def turn_count(board)

  counter = 0
  board.each do |player|
    if player != "" && player != " "
       counter += 1
    end
  end
  counter
end

def full?(board)
  turn_count(board) == 9 
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || won?(board)
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  else
    nil 
  end 
end





