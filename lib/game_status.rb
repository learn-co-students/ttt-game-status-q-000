# Helper Method
def position_taken?(board, location)
  !(board[location.to_i].nil? || board[location.to_i] == " ")
end

# Define your WIN_COMBINATIONS constant
  WIN_COMBINATIONS = [[0,1,2],[3,4,5],
                      [6,7,8],[0,3,6],
                      [1,4,7],[2,5,8],
                      [0,4,8],[2,4,6]]
def won?(board)
a = 0

  WIN_COMBINATIONS.each do |win_combination|
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]

  if (position_1 == "X" && position_2 == "X" && position_3 == "X") ||
    (position_1 == "O" && position_2 == "O" && position_3 == "O")
    a = win_combination.to_ary
    false
    else
    false

      end
  end

  if board.all? { |location| location == " "}
    false
    elsif WIN_COMBINATIONS.none? { |win_combination| a == win_combination}
    false
    else return a
  end

end

def full? (board)
board.all? do |element|
  element == "X" || element == "O"
end
end

def draw?(board)
if  full?(board) && !won?(board)
  true
  elsif won?(board)
  false
  elsif !won?(board) && !full?(board)
  false
end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
    else
    false
  end
end

def winner(board)
  if !won?(board)
    return nil
elsif won?(board).all? {|index| board[index] == "X"}
 return "X"
  elsif won?(board).all? {|index| board[index] == "O"}
 return "O"

end
end




