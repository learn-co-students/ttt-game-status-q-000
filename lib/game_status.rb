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

# won?
def won?(board)
    WIN_COMBINATIONS.each do |win_combination|
      # win_combination is a 3 element array of indexes that compose of a win, [0, 1, 2]
      # grab each index from the win_combination that composes a win
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]
     
     # load the value of the board at win_index_1
    position_1 = board[win_index_1]
     # load the value of the board at win_index_2
    position_2 = board[win_index_2]
     # load the value of the board at win_index_3
    position_3 = board[win_index_3]
    
    if position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" &&position_2 == "O" && position_3 == "O"
        # return winning combination indexes as an array 
        return win_combination
    end
  end
    # return false if there is no winning combination present in the board
    return false
end


# full?
def full?(board)
    # return true if all the spaces on the board has either "X" or "O" in it
    board.all? {|space| space == "X" || space == "O"}
end

# draw?
def draw?(board)
    # return true if the board has not been won and board is full
    if !won?(board) && full?(board)
        return true
    # return false if the board is not won and the board is not full
    elsif !won?(board) && !full?(board)
        return false
    # return false if the board is won
    else won?(board)
        return false
    end
end

# over?
def over?(board)
    # returns true if the board has been won, is a draw, or is full
    if won?(board) || draw?(board) || full?(board)
        return true
    else
     # return false if the game is not over  
        return false
    end
end

# winner
def winner(board)
    # the winning combination won on the board
    win_combination = won?(board)
    # if the game is won as indicated by the winning combination, 
    # return the token ("X" or "O") indicated by the 0 array index
    # of the combination that won on the board
    if win_combination
        return board[win_combination[0]]
    end
end
    