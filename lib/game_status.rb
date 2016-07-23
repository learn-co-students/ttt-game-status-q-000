# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
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
  [6,4,2]
]

def confirm_token_match(board, token = "X")
  WIN_COMBINATIONS.detect do |win_combos|
    win_combos.all? do |check_pos|
      position_taken?(board, check_pos) == true && board[check_pos] == token
    end
  end
end

def won?(board)

  winning_array = confirm_token_match(board)
  winning_array.is_a?( Array ) ? winning_array : winning_array = confirm_token_match(board, "O")
  winning_array.is_a?( Array ) ? winning_array : false

end

def full?(board)
  board.all? { |element| element == "X" || element == "O" } ? true : false
end

def draw?(board)
  full?(board) && !(won?(board)) ? true : false
end

def over?(board)
  full?(board) || draw?(board) || won?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board).pop] : nil
end
