# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "")
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
  [2,4,6]
  ]

def full?(board)
  [0,1,2,3,4,5,6,7,8].all? {|location| position_taken?(board, location)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end

def winner(board)
  if won?(board)
    winning_combination = won?(board)
    board[winning_combination[0][0]]
  else
    nil
  end
end

def won?(board)
  positions_taken = 0
  for i in 0..board.size - 1
    if position_taken?(board, i)
      positions_taken += 1
    end
  end
  if positions_taken == 0
    return false
  end
  x_wins = 0
  y_wins = 0
  final_win_combination = []
  WIN_COMBINATIONS.each do |win_combination|
    if win_combination.all? {|position| board[position] == "X"}
      x_wins += 1
      final_win_combination = win_combination
    elsif win_combination.all? {|position| board[position] == "O"}
      y_wins += 1
      final_win_combination = win_combination
    end
  end
  total_wins = x_wins + y_wins
  if x_wins != y_wins && total_wins > 0
    return final_win_combination
  else
    return false
  end
end
