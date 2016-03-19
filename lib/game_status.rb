# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], # top row
                    [3, 4, 5], # middle row
                    [6, 7, 8], # bottom row
                    [0, 3, 6], # left column
                    [1, 4, 7], # middle column
                    [2, 5, 8], # right column
                    [0, 4, 8], # diagonal top left
                    [2, 4, 6]] # diagonal top right

def won?(board)
  WIN_COMBINATIONS.each do |win_condition|
    win_index_1 = win_condition[0]
    win_index_2 = win_condition[1]
    win_index_3 = win_condition[2]

    board_index_1 = board[win_index_1]
    board_index_2 = board[win_index_2]
    board_index_3 = board[win_index_3]

    if (board_index_1 == "X" && board_index_2 == "X" && board_index_3 == "X") || (board_index_1 == "O" && board_index_2 == "O" && board_index_3 == "O")
      return win_condition
    end
  end
  return false
end

def full?(board)
  board.none? { |element| !position_taken?(board, board.index(element)) }
end

def draw?(board)
  full?(board) && !won?(board) ? true : false
end

def over?(board)
  full?(board) || won?(board) || draw?(board) ? true : false
end

def winner(board)
  winning_combo = won?(board)

  over?(board) ? board[winning_combo[0]] : nil
end