# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [
  [0,1,2],  #0
  [3,4,5],  #1
  [6,7,8],  #2
  [0,3,6],  #3
  [1,4,7],  #4
  [2,5,8],  #5
  [0,4,8],  #6
  [2,4,6]   #7
]

def won?(board)
  WIN_COMBINATIONS.each do |combo|

    position1 = board[combo[0]]
    position2 = board[combo[1]]
    position3 = board[combo[2]]

    if ((position1 == "X") && (position2 == "X") && (position3 == "X")) ||
       ((position1 == "O") && (position2 == "O") && (position3 == "O"))

       return [combo[0], combo[1], combo[2]]
    end
  end
  false
end


def full?(board)
  board.all? do |char|
    if (char == "X") || (char == "O")
      true
    else
      false
    end
  end
end


def draw?(board)
  if (full?(board) == true) && (won?(board) == false)
    true
  elsif (full?(board) == false) && (won?(board) == false)
    false
  elsif won?(board) == true
    false
  end
end


def over?(board)
  if (won?(board) == true) || (draw?(board) == true) || (full?(board) == true)
    true
  else
    false
  end
end


def winner(board)
  WIN_COMBINATIONS.each do |combo|
    if combo == won?(board)
      return board[combo[0]]
    end
  end
  nil
end
