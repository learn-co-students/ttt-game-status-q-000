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
  empty = board.all? { |value| value == ' ' }
  win = WIN_COMBINATIONS.find do |group|
    board[group[0]] == board[group[1]] &&
    board[group[0]] == board[group[2]] &&
    position_taken?(board, group[0])
  end
  empty == true || win.nil? ? false : win
end

def full?(board)
  board.all? { |value| value == 'X' || value == 'O' }
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  won?(board) || draw?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end