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
  WIN_COMBINATIONS.each do |combination|
    position_1 = board[combination[0]]
    position_2 = board[combination[1]]
    position_3 = board[combination[2]]

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return combination
    else
      false
    end
  end
  false
end

def full?(board)
  board.detect{|position| position == " "} == nil ? true : false # if the board has no " ", board is full and return true, else false
end

def draw?(board)
  full?(board) == true && won?(board) == false ? true : false # if the board is full but no one has won, return true, else false
end

def over?(board)
  won?(board) == true || draw?(board) == true || full?(board) == true ? true : false
end

def winner(board)
  array = won?(board)
  if array == false
    nil
  else
    board[array[0]] == "X" ? "X" : "O"
  end
end

