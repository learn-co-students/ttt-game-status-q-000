# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end






# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = 

[
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]


 board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]
 
# Definition of indexes that compose a top row win.
top_row_win = [0,1,2]

# Check if each index in the top_row_win array contains an "X"
if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
  "X won in the top row"


elsif board[top_row_win[3]] == "X" && board[top_row_win[4]] == "X" && board[top_row_win[5]] == "X"
  "X won in the middle row"


elsif board[top_row_win[6]] == "X" && board[top_row_win[7]] == "X" && board[top_row_win[8]] == "X"
  "X won in the bottom row"


elsif board[top_row_win[0]] == "X" && board[top_row_win[3]] == "X" && board[top_row_win[6]] == "X"
  "X won in the left column"


elsif board[top_row_win[1]] == "X" && board[top_row_win[4]] == "X" && board[top_row_win[7]] == "X"
  "X won in the middle column"


elsif board[top_row_win[2]] == "X" && board[top_row_win[5]] == "X" && board[top_row_win[8]] == "X"
  "X won in the right column"


elsif board[top_row_win[0]] == "X" && board[top_row_win[4]] == "X" && board[top_row_win[8]] == "X"
  "X won on the first diagonal"


elsif board[top_row_win[2]] == "X" && board[top_row_win[4]] == "X" && board[top_row_win[6]] == "X"
  "X won on the second diagonal"
end

def won?(board)


  won_comb_X = board.each_index.select do |position|
    board[position] == "X"
  end

  won_comb_O = board.each_index.select do |position|
    board[position] == "O"
  end
   
  if won_comb_X == [] && won_comb_O == []
    
    return false

  elsif (WIN_COMBINATIONS.none? {|subarray| subarray & won_comb_X == subarray}) && (WIN_COMBINATIONS.none? {|subarray| subarray & won_comb_O == subarray})

    return false

  
  elsif WIN_COMBINATIONS.none? {|subarray| subarray & won_comb_X == subarray}
    return won_comb_O
    

  else
    return won_comb_X
    
    
  end
end

def full?(board)
  if board.none? do |entry|
    entry == " " || entry == ""
  end
  
    return true
    
  
  else

    return false

  end
end

def draw?(board)

  if won?(board).is_a? (Array)
    return false

  elsif (full?(board) == true) && (won?(board) == false)

    return true

  else
    return false

  end
end

def over?(board)

  if draw?(board)
    return true

  elsif won?(board).is_a? (Array)
    return true

  else

    return false

  end
end

def winner(board)

  won_comb_X = board.each_index.select do |position|
    board[position] == "X"
  end

  won_comb_O = board.each_index.select do |position|
    board[position] == "O"
  end
   

if WIN_COMBINATIONS.any? {|subarray| subarray & won_comb_X == subarray}
    return "X"
    

elsif
    WIN_COMBINATIONS.any? {|subarray| subarray & won_comb_O == subarray}
    return "O"

  else
    return nil

  end
end
