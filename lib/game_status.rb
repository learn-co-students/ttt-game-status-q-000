# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2],
              [3, 4, 5],
              [6, 7, 8],
              [0, 3, 6],
              [1, 4, 7],
              [2, 5, 8],
              [0, 4, 8],
              [2, 4, 6]]

def won? board
  WIN_COMBINATIONS.each do |indexes|
    x, y, z = indexes
    if board[x] != " " && (board[x] == board[y] && board[y] == board[z])
      return indexes
    end
  end
  false
end

def full? board
  board.all? { |index| index == "X" || index == "O"}
end

def draw? board
  full?(board) && !won?(board)
end

def over? board
  won?(board) || draw?(board)
end

def winner board
  x, y, z = won?(board)
  board[x] if over?(board)
end
