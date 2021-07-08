# Helper Method

board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
    WIN_COMBINATIONS.each do |combo|
        list = board[combo[0]], board[combo[1]], board[combo[2]]
        if list.all? {|choice| choice == 'X'} or list.all? {|choice| choice == 'O'}
            return combo
        end
    end
    false
end

def full?(board)
    if board.any? {|choice| choice == " "}
        return false
    end
    return true
end

def draw?(board)
    if full?(board) and not won?(board)
        return true
    end
    return false
end
        
def over?(board)
    if draw?(board) or won?(board)
        return true
    end
    return false
end

def winner(board)
    if won?(board)
        winner = won?(board)[0]
    return board[winner]
    end
end
    

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2], #top row
    [3, 4, 5], #middle row
    [6, 7, 8], #bottom row
    [0, 3, 6], #left col
    [1, 4, 7], #middle col
    [2, 5, 8], #right col
    [0, 4, 8], #diagnol l to r
    [2, 4, 6] #diagnol r to l
] 

