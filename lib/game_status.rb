# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =  [ #Horizontal 
                      [0,1,2],
                      [3,4,5],
                      [6,7,8],
                      #Vertical
                      [0,3,6],
                      [1,4,7],
                      [2,5,8],
                      #Diagonal
                      [0,4,8],
                      [2,4,6]
                    ]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    xo1 = win_combination[0]
    xo2 = win_combination[1]
    xo3 = win_combination[2]

    if (board[xo1] == "X" && board[xo2] == "X" && board[xo3] == "X") ||
       (board[xo1] == "O" && board[xo2] == "O" && board[xo3] == "O")
       return win_combination
    end
  end

  return false
end

def full?(board) 
  x = board.all? { |value| value != " " }
  return x
end

def draw?(board)
  if !!(full?(board)) &&  !(won?(board))
    return true
  end
end

def over?(board)
  if  full?(board) == true && (draw?(board) == true || won?(board) != false)
    return true
  end
end 

def winner(board)
  if won?(board) != false
    x = won?(board)[0]
    return board[x]
  end
end