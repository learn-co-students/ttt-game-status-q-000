# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],
                    [3,4,5],
                    [6,7,8],
                    [0,3,6],
                    [1,4,7],
                    [2,5,8],
                    [0,4,8],
                    [2,4,6]]

#WON?: true/false if winner
def won?(board)
  WIN_COMBINATIONS.each do  |triple|
    if(winning?(board, triple))
      return triple
    end
  end
  return false
end

#WINNING? true/false if board, triplet make winner
def winning?(board, triplet)
  winner = triplet.all? {|spot| board[spot]=="X"}
  if winner
    return winner
  end
  winner = triplet.all? {|spot| board[spot]=="O"}
  if winner
    return winner
  end
  return false
end

#FULL?: true/false if board is full
def full?(board)
  result = board.none? {|mark| mark==" "}
  return result
end

#DRAW?: true/false if game is tie
#this function is redundant.  #WON? could easily have this functionality
def draw?(board)
  redundant = won?(board)
  if redundant
    return false
  end
  return true
end

#OVER?: true/false if game is over
def over?(board)
  if(!!won?(board))
    return true
  elsif(full?(board))
    return true
  end
  return false
end

#WINNER: return "X" or "O" for winner
def winner(board)
  triplet = won?(board)
  if !!triplet
    return board[triplet[0]]
  end
  return nil
end
