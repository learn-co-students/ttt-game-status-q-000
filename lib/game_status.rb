# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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

def won?(board)

  WIN_COMBINATIONS.each do |win_combo|
  win_index_1 = win_combo[0]
  win_index_2 = win_combo[1]
  win_index_3 = win_combo[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]
if position_1 == "X" && position_2 == "X" && position_3 == "X"
  win_combo
elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
  win_combo
end
end
end


def full?(board)
    if board.all? do |cell|
    cell == "X" || cell == "O"
    true
  end
end
end

def draw?(board)
  if !won?(board) && full?(board)
    true
  else !won?(board) && !full?(board) || !won?(board)
    false
  end
end

def over?(board)
  if draw || won?(board) || full?(board)
    true
  else
    false
  end
end

def winner(board)
  WIN_COMBINATIONS.each do |win_combo|
    if win_combo.all? { |x| x == "X" }
      return "X"
    elsif win_combo.all? { |x| x == "O" }
      return "O"
    end
    end
end
