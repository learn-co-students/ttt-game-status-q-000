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
    [6,4,2]
  ]

 def won?(board)
  WIN_COMBINATIONS.detect  do | combination| 
    position_taken?(board,combination[0]) && (board[combination[0]] == board[combination[1]] && board[combination[2]] == board[combination[1]])
  end
  
 end

def full?(board)
     board.each_index do |position| 
      if !position_taken?(board,position)
        false
        break
      else
        true
      end
    end
    
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  else
    false
  end
end


def over?(board)
  if draw?(board) || won?(board)
    true
  else
    false
  end
end

def winner(board)
  if won?(board)
    win_array = won?(board)
    board[win_array[1]]
  elsif draw?(board)
    nil
    
  end


end