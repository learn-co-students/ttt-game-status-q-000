# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
                    # Horizantol wins:
                    [0,1,2], # top row
                    [3,4,5], # middle row
                    [6,7,8], # bottom row
                    # -----

                    # Vertical wins:
                    [0,3,6], # column 1
                    [1,4,7], # column 2
                    [2,5,8], # column 3
                    # -----

                    # Diagonal wins:
                    [0,4,8], # back-slash line-up win
                    [2,4,6], # forward-slash line-up win
                    # -----
]


def won?(board)

  WIN_COMBINATIONS.each do |win_combinations|
    win_index_1 = win_combinations[0]
    win_index_2 = win_combinations[1]
    win_index_3 = win_combinations[2]

    win_by_X = board[win_index_1] == "X" && board[win_index_2] == "X" && board[win_index_3] == "X"
    win_by_O = board[win_index_1] == "O" && board[win_index_2] == "O" && board[win_index_3] == "O"

    win_detected = win_by_X || win_by_O

    if win_detected
      return win_combinations
    end

  end

  false # No win detected inside #each, false is for "There is no win in game"

end


def full?(board)
  board.each do |token|
    if token != "X" && token != "O"
      return false
    end
  end

  true
end

def draw?(board)

  turns_exhausted_yet_no_win = !won?(board) && full?(board)  # no win with a complete board
  game_left_dangling = !won?(board) && !full?(board)  # no win and incomplete board
  game_not_left_dangling = !(game_left_dangling)

  is_draw = game_not_left_dangling && turns_exhausted_yet_no_win

end

def over?(board)

  is_over = won?(board) || draw?(board)

end

def winner(board)

  output = won?(board)
  if(output)
    return board[output[0]]
  end

end
