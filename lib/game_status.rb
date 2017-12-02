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
  WIN_COMBINATIONS.each do |list|
    check = false
    list.each do |loc|
      if position_taken?(board , loc)
        check = true
      else
        check = false
      end
    end
    if (check) && (list.all? { |state| board[state] == "X" }) || (list.all? { |state| board[state] == "O" })
      return list
    end
  end
  return false
end
#..........................full
def full?(board)
  return board.all? { |state|  state == "X" || state == "O" }
end
#..............................draw
def draw?(board)
  return (full?(board) && won?(board) == false)? true : false
end
#...........................over
def over?(board)
  return (full?(board) || won?(board) != false || draw?(board)) ? true : false
end
#............................winner
def winner(board)
  temp  = won?(board)
  return (temp == false) ? nil : board[temp[0]]
end
