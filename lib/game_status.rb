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
  [2,4,6]
]

def won?(board)
  game = false
  WIN_COMBINATIONS.each do |win_combo|
    if !game
      if win_combo.all? {|win| board[win] == "X"} || win_combo.all? {|win| board[win] == "O"}
        game = win_combo
      end
    end
  end
  game
end

def full?(board)
  board.all? {|i| i != " "}
end

def draw?(board)
  full?(board) == true && won?(board) == false
end

def over?(board)
    draw?(board) == true || won?(board) != false || full?(board) == true
end

def winner(board)
  player = won?(board) # returns array such as [0,1,2]
  if player
    board[player[0]] # returns value in first position of array
  else
    nil
  end
end
