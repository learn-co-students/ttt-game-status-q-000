# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
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
  win_combo = nil
  WIN_COMBINATIONS.each do |combo|
    if board[combo[0]] == "X" && board[combo[1]] == "X" && board[combo[2]] == "X"
      win_combo = combo
    elsif board[combo[0]] == "O" && board[combo[1]] == "O" && board[combo[2]] == "O"
      win_combo = combo
    end
  end
  win_combo
end

def full?(board)
  full_board = nil
  board.all? do |space|
    if space == "X" || space == "O"
      full_board = true
    end
  end
  if board.include?(" ")
    full_board = nil
  end
  full_board
end

def draw?(board)
  draw_game = nil
  if full?(board) && !won?(board)
    draw_game = true
  else
    draw_game = nil
  end
  draw_game
end

def over?(board)
  game_over = nil
  if draw?(board) || won?(board)
    game_over = true
  else
    game_over = nil
  end
  game_over
end

def winner(board)
  champ = nil
  if won?(board)
    tokencheck = won?(board)
    champ = board[tokencheck[0]]
  end
  champ
end
