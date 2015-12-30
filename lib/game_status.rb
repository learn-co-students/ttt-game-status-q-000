# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], [3, 4, 5], [6, 7, 8],
  [0, 3, 6], [1, 4, 7], [2, 5, 8],
  [0, 4, 8], [2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.any? do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if ((position_1 == "X" and position_2 == "X" and position_3 == "X") or
        (position_1 == "O" and position_2 == "O" and position_3 == "O"))
      return win_combination
    else
      false
    end
  end
end

def full?(board)
  !(board.include?(" ") or board.include?("") or board.include?(nil))
end

def draw?(board)
  (!won?(board) and full?(board)) and !(!won?(board) and !full?(board)) and !(won?(board))
end

def over?(board)
  won?(board) or draw?(board) or full?(board)
end

def winner(board)
  if won?(board) != false
    winner_array = won?(board)
    board[winner_array[0]]
  else
    nil
  end
end

#board = ["O", " ", " ", " ", "O", " ", " ", " ", "O"]
board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
puts winner(board)