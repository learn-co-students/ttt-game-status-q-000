# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  WIN_COMBINATIONS.each do |combo|
    win = combo.all? do |position|
      position_taken?(board,position) && (board[position] == board[combo[0]])
    end
    if win
      return combo
    end
  end
  return false
end

def full?(board)
  full = board.none? {|x| x == " " }
end

def draw?(board)
  draw = false
    if full?(board)
      draw = true
    end
    if won?(board)
      draw = false
    end
  draw
 end

 def over?(board)
  over = false
    if draw?(board) || won?(board) 
      over = true
    end
  over
 end

 def winner(board)
  winner = nil
    if won?(board)
      winner = board[won?(board)[0]]
    end
  winner
 end