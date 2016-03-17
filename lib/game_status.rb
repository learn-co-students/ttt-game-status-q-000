# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [2, 4, 6],
  [0, 4, 8]
]

def won?(board)
  WIN_COMBINATIONS.each do |first|
    win_index_1 = first[0]
    win_index_2 = first[1]
    win_index_3 = first[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      winarray = Array.new
      winarray << win_index_1 << win_index_2 << win_index_3
      return winarray
    end
  end
  return false
end

def full?(board)
  board.all? do |spot|
    spot == "X" || spot == "O"
  end
end

def draw?(board)
  if won?(board) == false && full?(board) == true
    return true
  elsif won?(board) == false && full?(board) == false
    return false
  elsif won?(board) == true
    return false
  end
end

def over?(board)
  if won?(board) == true || full?(board) == true || draw?(board) == true
    return true
  end
end

def winner(board)
    x_item = 0
    o_item = 0
  board.select do |spots|

    if spots == "X"
      x_item += 1
    elsif spots == "O"
      o_item += 1
    end
  end
  if x_item > o_item
    return "X"
  elsif o_item > x_item
    return "O"
  end

end



