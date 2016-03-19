# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
    [ 0, 1, 2],
    [ 3, 4, 5],
    [ 6, 7, 8],
    [ 0, 3, 6],
    [ 1, 4, 7],
    [ 2, 5, 8],
    [ 0, 4, 8],
    [ 2, 4, 6],
]

#won?

def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
    
    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" &&position_2 == "O" && position_3 == "O"
        return win_combination
    end
  end
    return false
end


#full?
def full?(board)
    board.all? do |space|
      space == "X" || space == "O"
    end
end

#draw?
def draw?(board)
    if !won?(board) && full?(board)
        return true
    elsif !won?(board) && !full?(board)
        return false
    else won?(board)
        return false
    end
end

#over?
def over?(board)
    if won?(board) || draw?(board) || full?(board)
        return true
    else
        return false
    end
end

#winner
def winner(board)
    win_combination = won?(board)
    if win_combination
        board[win_combination[0]]
    end
end
    