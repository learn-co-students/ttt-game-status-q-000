# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], #top row
  [3, 4, 5], #middle row
  [6, 7, 8], #bottom row
  [0, 4, 8], #diagonal left to bottom right
  [2, 4, 6], #diagonal right to bottom left
  [0, 3, 6], #left column
  [1, 4, 7], #center column
  [2, 5, 8], #right column
]

def won?(board)
  won = false
  WIN_COMBINATIONS.each do |combo|
    first = combo[0]
    second = combo[1]
    third = combo[2]

    position_1 = board[first]
    position_2 = board[second]
    position_3 = board[third]

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return combo
    elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
      return combo
    else
      won = false
    end
  end

  return won
end

def full?(board)
  #if all position_takens evaluate to true
  #then board.all? will evaluate to true
  (0..8).to_a.all? {|spot| position_taken?(board, spot)}
end

def draw?(board)
  !won?(board) && full?(board)
end


def over?(board)
  #won?(board) will return an array, which is truthy
  full?(board) || won?(board) || draw?(board)
end

def winner(board)
  #position of winner
  if won?(board)
    position = won?(board)[0] 
    return board[position]
  end
end