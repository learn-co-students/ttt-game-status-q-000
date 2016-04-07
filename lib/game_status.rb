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
  [2,4,6]
]

def won? (board)
  WIN_COMBINATIONS.each do |level_one|
      windex1 = level_one[0]
      windex2 = level_one[1]
      windex3 = level_one[2]
      pos_1 = board[windex1]
      pos_2 = board[windex2]
      pos_3 = board[windex3]
      new_array = []
      if pos_1 == "X" && pos_2 == "X" && pos_3 == "X"
        new_array = new_array.push(level_one[0],level_one[1],level_one[2])
        return new_array
      elsif pos_1 == "O" && pos_2 == "O" && pos_3 == "O"
        new_array = new_array.push(level_one[0],level_one[1],level_one[2])
        return new_array
      end
    end
    return false
end

def full? (board)
  board.each do |x|
    if x == " " || x == "" || x == nil
      return false
    end
  end
  return true
end


def draw? (board)
  if !(won?(board)) && full?(board)  
    return true
  elsif !(won?(board)) && !(full?(board))
    return false
  elsif won?(board)
    return false
  end
end


def over? (board)
  if won?(board) || draw?(board) ||full?(board)
    return true
  end
end


def winner(board)
  if won?(board)
    champ = won?(board)
    champ = champ[0]
    return board[champ]
  end
end







