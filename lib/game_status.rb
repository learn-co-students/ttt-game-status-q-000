# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom Row
  [0,3,6], # first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], # R to L diagonal
  [2,4,6] # L to R diagonal
]

def won?(board)
  WIN_COMBINATIONS.each do |win_array|

  win_index_1 = win_array[0]
  win_index_2 = win_array[1]
  win_index_3 = win_array[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

      if ((position_taken?(board, win_index_1) && position_1 =="X") && (position_taken?(board, win_index_2) && position_2 =="X") && (position_taken?(board, win_index_3) && position_3 =="X") or 
        (position_taken?(board, win_index_1) && position_1 =="O") && (position_taken?(board, win_index_2) && position_2 =="O") && (position_taken?(board, win_index_3) && position_3 =="O"))
       return win_array
    end
  end
         return false
end

def full?(board)
  board.all? {|i| (i =="X" || i =="O")}
end

def draw?(board)
  if !won?(board) && full?(board) 
    return true 
  elsif !won?(board) && !full?(board) 
    return false 
  elsif won?(board) 
    return false
  end
end

def over?(board)  
won?(board) || full?(board) || draw?(board) ? true : false 
end

def winner(board)
  if over?(board) == true
    return board[won?(board)[0]]
  end
end
