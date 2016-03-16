# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Center column
  [2,5,8], # Right column
  [0,4,8], # Right diagonal
  [2,4,6] # Left diagonal
]

def won?(board)
  WIN_COMBINATIONS.find do |win_combos|
    o_winner = win_combos.all? do |position|
      board[position].include?("O")
    end
    x_winner = win_combos.all? do |position|
      board[position].include?("X")
    end

    return win_combos if o_winner || x_winner
  end
end

def winner(board)
  game_result = won?(board)
  !!game_result ? board[game_result.first] : game_result
end

def full?(board)
  board.all? do |board_token|
    board_token == "X" || board_token == "O"
  end
end

def draw?(board)
  if full?(board) && !won?(board)
    true
  elsif won?(board) || !won?(board) && !full?(board)
    false
  end
end

def over?(board)
  won?(board) || draw?(board) || full?(board) ? true : false
end
