# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def won?(board)
  WIN_COMBINATIONS.each do |array|
    array.each do |element|
    if board[array[0]] == "X" && board[array[1]] == "X" && board[array[2]] == "X"
      return array
    elsif board[array[0]] == "O" && board[array[1]] == "O" && board[array[2]] == "O"
      return array
    else
    end
  end
end
end



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