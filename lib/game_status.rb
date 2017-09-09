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
  [6,4,2]
]

#Accepts board. Finds the winning position.
def win_position?(board)
WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    if [board[win_index_1],board[win_index_2],board[win_index_3]].all?{|value| value == "X"}
      return win_combination
    elsif [board[win_index_1],board[win_index_2],board[win_index_3]].all?{|value| value == "O"}
      return win_combination
    end

end
end

#Accepts board. Returns winning position.
def won?(board)
if (win_position?(board).length) == 3
  return win_position?(board)
elsif (full?(board)) == true
  return false
else
  return false
end
end


#define full? method. Accepts a board and returns true if every element in board contains either an "X" or "O".
def full?(board)
  if board.any?{|position| position == nil || position == "" || position == " "}
    return false
  else
    return true
  end
end

#define draw? method. Accepts a board.
#Returns:
#true - no win & board is full
#false - no win & board not full
#false - won
def draw?(board)
if won?(board) == false
  if full?(board) == true
    return true
  elsif full?(board) == false
    return false
  end
elsif (won?(board).length) == 3
  return false
end
end

#define over? method. Accepts a board.
#returns true if won, is a draw, or is full.
def over?(board)
if full?(board) == true
    return true
  elsif full?(board) == false && won?(board) == false
    return false
elsif full?(board) == false && (won?(board).length) == 3
    return true
end
end

#define winner method. Accepts a board.
#returns the token "X" or "O" that has won given a winning board.
def winner(board)
win_index = won?(board)

if won?(board) != false
  return board[win_index[0]]
end

end
