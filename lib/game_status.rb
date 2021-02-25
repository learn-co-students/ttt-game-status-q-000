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
    WIN_COMBINATIONS.find do |win_combination|
      board[win_combination[0]] == "X" && board[win_combination[1]] == "X" && board[win_combination[2]] == "X" || board[win_combination[0]] == "O" &&  board[win_combination[1]] == "O" && board[win_combination[2]] == "O"
    end
  end
  
  def full?(board)
    board.all? do |position|
      position == "X" || position == "O"
    end
  end
  
  def draw?(board)
    won?(board) == nil && full?(board) == true
  end
  
  def over?(board)
    draw?(board) || full?(board) || won?(board) != nil
  end
  
  def winner(board)
    if over?(board)
      board[won?(board)[0]]
    end
  end
  
  
  
  