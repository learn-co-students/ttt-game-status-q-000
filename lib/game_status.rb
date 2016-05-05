# Helper Method
def turn_count(board)
  turns = 0;
  ![0,1,2,3,4,5,6,7,8].each do |pos|
    if position_taken?(board,pos)
      turns+=1;
    end
  end
  turns;
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6],[1,4,7],[2,5,8],
                    [0,4,8],[6,4,2]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    if((board[combo[0]]==board[combo[1]]) && (board[combo[1]]==board[combo[2]]) && (position_taken?(board,combo[0])))
      return combo
    end
  end
  false
end

def full?(board)
  ![0,1,2,3,4,5,6,7,8].any?{|pos| !position_taken?(board,pos)}
end

def draw?(board)
  if(!won?(board) && full?(board))
    true
  else
    false
  end
end

def over?(board)
  if(draw?(board) || won?(board))
    true
  else
    false
  end
end

def winner(board)
  if(won?(board))
    return board[won?(board)[0]]
  else
    nil
  end
end