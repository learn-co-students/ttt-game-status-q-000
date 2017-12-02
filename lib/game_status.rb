# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end




WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5], # Middle row
  [6,7,8], # Bottom row
  [0,3,6], # Left column
  [1,4,7], # Middle column
  [2,5,8], # Right column
  [0,4,8], # Left down diagonal
  [6,4,2]  # Left up diagonal
]

winner_token = ""

def won?(board)
  return false if board.all? {|token| token == "" || token == " "}


WIN_COMBINATIONS.each do |win_combination|

    # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3


if [position_1, position_2, position_3].all? {|token| token == "X"}
  winner_token = "X"
  return [win_index_1, win_index_2, win_index_3]
elsif [position_1, position_2, position_3].all? {|token| token == "O"}
  winner_token = "O"
  return [win_index_1, win_index_2, win_index_3]
end 
end
  return false
end

def full?(board)
  board.all? {|token| token == "X" || token == "O"}
 end
 
def draw?(board)
  return false if full?(board) == false
  return false if won?(board) == true
  return true if won?(board) == false && full?(board) == true
end

def over?(board)
  return true if draw?(board) == true
  return true if won?(board) == true 
  return true if full?(board) == true
end

def winner(board)
  WIN_COMBINATIONS.detect do |token|
    x_wins = token.all? { |token| board[token] == "X"}
    o_wins = token.all? { |token| board[token] == "O"}
  
return "X" if x_wins
return "O" if o_wins
  end
end
