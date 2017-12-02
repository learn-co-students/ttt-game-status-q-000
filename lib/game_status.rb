# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]

def won?(board)
  empty = board.all? { |position| position == " "}
if empty
  return false
end
board.all? { |position| position == "O"}
board.all? { |position| position == "X"}

WIN_COMBINATIONS.each do |win_combination|
    position_1 = board[win_combination[0]]
    position_2 = board[win_combination[1]]
    position_3 = board[win_combination[2]]
      if (position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O")
        return win_combination
      end
    end
    false
  end

  def full?(board)
    full = board.all? {|position| position == "X" || position == "O"}
    end

  def draw?(board)
    full?(board) == true && won?(board) == false
  end

  def over?(board)
    won?(board) == true || draw?(board) == true || full?(board) == true
  end

  def winner(board)
    winning_array = won?(board)
    if winning_array != false
    return board[winning_array.first]
    else
    nil
  end
  end
 