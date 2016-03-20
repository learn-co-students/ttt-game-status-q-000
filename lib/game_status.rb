# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # top horizontal
  [3,4,5], # middle horizontal
  [6,7,8], # bottom horizontal
  [0,3,6], # left vertical
  [1,4,7], # middle vertical
  [2,5,8], # right vertical
  [0,4,8], # left diagnal
  [6,4,2] # right diagnal
  ]

def won?(board)
    WIN_COMBINATIONS.each do |combo|
  win_1 = combo[0]
  win_2 = combo[1]
  win_3 = combo[2]

  pos_1 = board[win_1]
  pos_2 = board[win_2]
  pos_3 = board[win_3]

    if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
    return combo
    end
 end
  return false
end

def full?(board)
  board.each do |spot|
    if spot.nil? || spot == " "
      return false
    end
  end
  return true
end

def draw?(board)
  if full?(board) && !won?(board)
        true
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
      true
  end
end

def winner(board)
    if won?(board)
        board[won?(board)[0]]
    end
end