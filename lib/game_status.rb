# Helper Method
board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]


def position_taken_o?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "X")
end

def position_taken_x?(board, location)
  !(board[location].nil? || board[location] == " " || board[location] == "O")
end

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8], #horizontals
  [0,3,6],
  [1,4,7],
  [2,5,8], #verticals
  [0,4,8],
  [6,4,2], #diags
  ]
#def won?(board)
  #WIN_COMBINATIONS.each do |win_combination|

#  win_index_1 = win_combination[0]
 # win_index_2 = win_combination[1]
#  win_index_3 = win_combination[2]

#  position_1 = board[win_index_1]
#  position_2 = board[win_index_2]
#  position_3 = board[win_index_3]

#  if position_1 == "X" && position_2 == "X" && position_3 == "X"
#    return win_combination
#  elsif position_1 == "O" && position_2 == "O" && position_3 == "O"
#    return win_combination
 # else

 # end
 # end
#end




def won?(board)
  WIN_COMBINATIONS.any? do |combo|
    if combo.all? do |i|
      position_taken_x?(board, i)
      end
      return combo
      puts "Congratulations, X wins!"
      break
    elsif combo.all? do |i|
      position_taken_o?(board, i)
      end
      return combo
      puts "Congratulations, O wins!"
      break
    else
      false
    end
  end
end

def full?(board)
  #(0..8).none?{|i| position_taken?(board,i)}
  (0..8).all?{|i| position_taken?(board,i)}
end

def draw?(board)
  full?(board) && !won?(board)
end

def over?(board)
  full?(board) || draw?(board) || won?(board)
end

def winner(board)
  WIN_COMBINATIONS.any? do |combo|
    if combo.all? do |i|
      position_taken_x?(board, i)
      end
      return "X"
      break
    elsif combo.all? do |i|
      position_taken_o?(board, i)
      end
      return "O"
      break
    else
    end
  end
  return nil
end

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

display_board(board)
print over?(board)
