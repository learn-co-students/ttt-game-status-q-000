# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
def won?(board)
  win0=WIN_COMBINATIONS[0]
  eval=Array.new(3,"")
  win0.each do |number|
    eval[number]=board[number]
  end
  if eval[1]==eval[2] && eval[2]==eval[3]
    puts "puts game won by #{win0}"
  end
end

board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

won?(board)
