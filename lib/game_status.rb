# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

WIN_COMBINATIONS = [
  [0, 1, 2],
  [3, 4, 5],
  [6, 7, 8],
  [0, 3, 6],
  [1, 4, 7],
  [2, 5, 8],
  [0, 4, 8],
  [2, 4, 6]
]

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    return false
  elsif
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]

      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      if position_1 != " " && position_1 == position_2 && position_1 == position_3
        return win_combination
      end
    end
  else 
    return false
  end
end

def draw?(board)
  board.any? do |space|
    if space == " "
      return false
    end
  end
  if won?(board)
    return false
  else
    return true
  end
end

def full?(board)
  if board.any?{ |i| i == " "}
    return false
  else
    return true
  end
end

def over?(board)
  if full?(board)
    return true
  else
    return false
  end
end

def winner(board)
  if won?(board)
    player = won?(board)
    puts "#{board[player[0]]} wins!"
    return board[player[0]]
  else
    return nil
  end
end