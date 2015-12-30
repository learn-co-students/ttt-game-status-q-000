# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
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
[2, 4, 6]
]

def won?(board)
  WIN_COMBINATIONS.each do |win_combo_array|
    count = 0
      win_combo_array.each do |win_elements|
        if board[win_elements] == "X"
          count +=1
        end
     end

      if count == 3 || count == 0 && position_taken?(board, win_combo_array[0]) && position_taken?(board, win_combo_array[1]) && position_taken?(board, win_combo_array[2])
        return win_combo_array
      end
    end  
  return false
end

def full?(board)
  board.none? {|location| location == " "}
end

def draw?(board)
  if full?(board) && !won?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) || draw?(board) || full?(board)
    return true
  end
end

def winner(board)
  if won?(board)
    return board[won?(board)[0]]
  end
end


