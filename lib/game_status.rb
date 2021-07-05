# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0, 1, 2],
[3, 4, 5],
[6, 7, 8],
[0, 3, 6],
[1, 4, 7],
[2, 5, 8],
[0, 4, 8],
[2, 4, 6]]

def won?(board)
  WIN_COMBINATIONS.each do |winning_trio| 
      winning_trio_index_1 = winning_trio[0]
      winning_trio_index_2 = winning_trio[1]
      winning_trio_index_3 = winning_trio[2]

      pos_1 = board[winning_trio_index_1]
      pos_2 = board[winning_trio_index_2]
      pos_3 = board[winning_trio_index_3]

      if (pos_1 == "X" && pos_2 == "X" && pos_3 == "X") || (pos_1 == "O" && pos_2 == "O" && pos_3 == "O")
      return winning_trio
      end 
    end 
    return false
  end

def full?(board)
  board.all? {|place| place == "X" || place == "O"}
end

def draw?(board)
  won?(board) == false && full?(board) == true
end

def over?(board)
  won?(board) || full?(board) || draw?(board)
end

def winner(board)
  if won?(board)
    win_pos_1 = board[won?(board)[0]]
    return win_pos_1
end
end
