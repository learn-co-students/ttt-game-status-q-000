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
  WIN_COMBINATIONS.each do |i|
    subboard = board[i[0]..i[0]] + board[i[1]..i[1]] + board[i[2]..i[2]]
    return i if subboard.all? { |j| j == 'X' } or subboard.all? { |j| j == 'O' } 
  end
  false
end

def full?(board)
  board.all? { |i| i == 'X' or i == 'O' }
end

def draw?(board)
  full?(board) and !won?(board)
end

def over?(board)
  full?(board) or won?(board)
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end