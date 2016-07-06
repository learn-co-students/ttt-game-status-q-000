# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0, 1, 2], # Top row = WIN_COMBINATIONS[0]
  [3, 4, 5], # Middle row = WIN_COMBINATIONS[1]
  [6, 7, 8], # Bottom row = WIN_COMBINATIONS[2]
  [0, 3, 6], # Left column = WIN_COMBINATIONS[3]
  [1, 4, 7], # Middle column = WIN_COMBINATIONS[4]
  [2, 5, 8], # Right column = WIN_COMBINATIONS[5]
  [0, 4, 8], # Left-to-right Diagonal = WIN_COMBINATIONS[6]
  [2, 4, 6] # Right-to-left Diagonal = WIN_COMBINATIONS[7]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1] # load the value of the board at win_index_1
    position_2 = board[win_index_2] # load the value of the board at win_index_2
    position_3 = board[win_index_3] # load the value of the board at win_index_3

    # return false until position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"

    # return [win_index_1, win_index_2, win_index_3].to_a
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O"
      return [win_index_1, win_index_2, win_index_3]
    else
      false
    end
  end
end
