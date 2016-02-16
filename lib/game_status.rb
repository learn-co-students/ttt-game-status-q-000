# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  if board == [" ", " ", " ", " ", " ", " ", " ", " ", " "]
    false
  elsif draw?(board)
    false
  else
    winning_combo(board)
  end
end

def draw?(board)
  board_status = []
  WIN_COMBINATIONS.each {|combo|
    new_array = Array.new()
    combo.each {|pos|
      new_array.push(board[pos])
      }
    if new_array.length == 3
      board_status.push(new_array)
    end
    }
  if board_status.include?(["X", "X", "X"]) || board_status.include?(["O", "O", "O"])
    false
  else
    true
  end
end

def full?(board)
  if board.any? {|pos| pos == " "} == false
    draw?(board)
  else
    false
  end
end
#board = ["X", "O", "X", "O", "X", "O", "X", "O", "X"]
def winning_combo(board)
  board_status = []
  WIN_COMBINATIONS.each {|combo|
    new_array = Array.new()
    combo.each {|pos|
      new_array.push(board[pos])
      }
    if new_array.length == 3
      board_status.push(new_array)
    end
    if board_status.include?(["X", "X", "X"]) || board_status.include?(["O", "O", "O"])
      return combo
    end
    }
end

def over?(board)
  if won?(board).class == Array
    true
  elsif full?(board) == false
    false
  else
    true
  end
end

def winner(board)
  if won?(board).class == Array
    player_won = won?(board)
    board[player_won[0]]
  else
    nil
  end
end