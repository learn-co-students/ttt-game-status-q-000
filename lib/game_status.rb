# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
                      [3,4,5],
                      [6,7,8],
                      [0,4,8],
                      [6,4,2],
                      [0,3,6],
                      [1,4,7],
                      [2,5,8]]

def won?(board)
  WIN_COMBINATION.each do |win_combination|
    win_index1 = win_combination[0]
    win_index2 = win_combination[1]
    win_index3 = win_combination[2]

    position_1 = board[win_index1]
    position_2 = board[win_index2]
    position_3 = board[win_index3]
  end

    if position_1 == "X" && position_2 == "X" && position_3 == "X"
      return win_combination
    elsif position_1 == "O" && posotion_2 == "O" && position_3 == "O"
     return win_combination
    else
      false
    end

  

end

