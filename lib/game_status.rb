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
  winner = false
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      winner = combination
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      winner = combination
    end
  end
  return winner
end

# defining full?
def full?(board)
  board.all? do |index|
    index == "X" || index == "O"
  end
end


# defining draw?
def draw?(board)
  draw = false
  if full?(board) && won?(board) == false
    draw = true
  end
return draw
end

# defining over?
def over?(board)
  over = false
  if full?(board) || won?(board) || draw?(board)
    over = true
  end
return over
end

# brainstorming winner?
def winner(board)
  winning_player = nil
  WIN_COMBINATIONS.each do |combination|
    if board[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      winning_player = "X"
    elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      winning_player = "O"
    end
  end
  return winning_player
end



  #if won?(board)
  #WIN_COMBINATIONS.each do |combination|
    #if board[[combination[0]] == "X" && board[combination[1]] == "X" && board[combination[2]] == "X"
      #winning_player = "X"
    #elsif board[combination[0]] == "O" && board[combination[1]] == "O" && board[combination[2]] == "O"
      #winning_player = "O"
    #end
    #end
  #return winning_player
#end