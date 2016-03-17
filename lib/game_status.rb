# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], #top row
  [3,4,5], #middle row
  [6,7,8], #bottom row
  [0,3,6], #first column
  [1,4,7], #second column
  [2,5,8], #third column
  [0,4,8], #diagonal left to right
  [2,4,6] #diagonal right to left
  ]

def won?(board)
   WIN_COMBINATIONS.detect do |combination| #ex: [0,1,2]
        board[combination[0]] == board[combination[1]] &&
        board[combination[1]] == board[combination[2]] &&
        position_taken?(board, combination[0])
   end
end

def full?(board)
  counts = Hash.new(0)
  board.each { |value| counts[value] += 1}
  counts["X"] + counts["O"] == 9 ? true : false
end

def draw?(board)
  full?(board) & !won?(board) ? true : false
end

def winner(board)
  won?(board) ? board[won?(board)[0]] : nil
end

def over?(board)
  won?(board) || draw?(board) || full?(board)
end