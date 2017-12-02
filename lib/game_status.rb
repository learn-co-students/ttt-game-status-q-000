# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
                    [0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6],
                  ]


def won?(board)
    WIN_COMBINATIONS.each do |arr|
        if board[arr[0]] == "X" && board[arr[1]] == "X" && board[arr[2]] == "X" ||
            board[arr[0]] == "O" && board[arr[1]] == "O" && board[arr[2]] == "O"


            return arr # return the win_combination indexes that won.
        end
    end
  false
end

def full?(board)
   board.all? do |space|
    space!=" "
   end
end

def draw?(board)
  if  full?(board) &&  !won?(board)
    true
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  end
end

def winner(board)
  arr = won?(board)
  if arr!=false
    return board[arr[0]]
  end
end











