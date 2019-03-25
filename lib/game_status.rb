# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
    WIN_COMBINATIONS.detect do |win|
    board[win[0]] == board[win[1]] && board[win[1]] == board[win[2]] &&
    position_taken?(board, win[0])
    end
end

def full?(board)
  board.all? do |token| token == "X" || token =="O"
  end
end

  def draw?(board)
    full?(board) && !won?(board)
  end

  def over?(board)
    won?(board) || full?(board)
  end

  def winner(board)
    if w_combo = won?(board)
      board[w_combo.first]
    end
  end






# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]
  ]