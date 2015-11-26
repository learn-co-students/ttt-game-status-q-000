# Helper Methods
def position_taken?(board, location)
  !(board[location.to_i].nil? || board[location.to_i] == " ")
end

WIN_COMBINATIONS = [
    [0,1,2],
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [2,4,6]
  ]


def won?(board)
  i = 0
  position = []
  wins = 0

if board == Array.new(9," ") || board == Array.new(9,nil)
    puts "emptiness caused this"
    false
  else
  WIN_COMBINATIONS.each do |wc|
    wc.each do |wi|
      position[i] = board[wi]
    i += 1

    if (board[wc[0]] == "X" && board[wc[1]] == "X" && board[wc[2]] == "X") || (board[wc[0]] == "O" && board[wc[1]] == "O" && board[wc[2]] == "O")

      return wc

        wins += 1
      end
   end
end

#puts "#{wi}"
  if wins == 0
    puts " No wins caused this "
    return false
  end
 end

end

def full?(board)
  board.none? do |open|
    (open == "") || (open ==" ") || (open== nil)
      end
end

def draw?(board)
  if !(won?(board))
    if full?(board)
      true
    else
      false
    end
  end
end

def over?(board)
  if won?(board) || draw?(board)
    true
  else
    false
  end
end

def winner(board)
  new_wc = won?(board)
  if won?(board)
    if board[new_wc[0]] == "X"
      "X"
    else
      "O"
    end
  end
end