# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end




  WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6], # Middle row
    # ETC, an array for each win combination
]
# Define your WIN_COMBINATIONS constant

/def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]
      position_1 = board[win_index_1] # load the value of the board at win_index_1
      position_2 = board[win_index_2] # load the value of the board at win_index_2
      position_3 = board[win_index_3] # load the value of the board at win_index_3
      if position_1 == "X" && position_2 == "X" && position_3 = "X"
      return win_combination
      else return false
      end
    end
  end/

  def won?(board)
  WIN_COMBINATIONS.each do |combo|
    return combo if combo.all? {|position| board[position] == 'X'}
    return combo if combo.all? {|position| board[position] == 'O'}
  end
  return false if board.all? { |position| position != " "}
  return false if board.all? { |position| position == " "}
end

def full?(board)
  /return true if won?(board)==true && draw?(board)==true/
  /return true if board.all? {|element| element.to_i == "X" || element.to_i == "O" }/
  return false if won?(board)==false && draw?(board)==false
  return true if won?(board)==false && draw?(board)==true
end




def draw?(board)
  if won?(board)==false || full?(board)== true
    return true
  end
end

def over?(board)
  return true if won?(board) || draw?(board) || full?(board)
end

def winner(board)
    WIN_COMBINATIONS.each do |combo|
    return "X" if combo.all? {|position| board[position] == 'X'}
   return "O" if combo.all? {|position| board[position] == 'O'}
  end
  return nil
end




