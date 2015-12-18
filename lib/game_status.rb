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

def won?(board) # is a mess.  refactor.  
    array_of_diagonals = []
    won = false
    win_combination = false
    WIN_COMBINATIONS.each do |winning|
        array_of_diagonals = [ board[winning[0]], board[winning[1]], board[winning[2]]]
        won = array_of_diagonals.all? {|f| f == 'O'}
        if won == false
            won = array_of_diagonals.all? {|f| f == 'X'}
        end
        if won == true
            win_combination = winning
        end
        break if won == true
    end
    win_combination
end

def full?(board)
    board.all? {|f| /[OX]/.match(f)}
end    
    
def draw?(board)
    full?(board) && !won?(board)
end

def over?(board)
    full?(board) || won?(board)
end
    
def winner(board)
    if won?(board)
        board[won?(board)[1]]
    else
        nil
    end
end
    
    
    
    
    
    
    
