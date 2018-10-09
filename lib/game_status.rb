# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [

    [0,1,2], #top row
    [3,4,5],
    [6,7,8],
    [0,3,6],
    [1,4,7],
    [2,5,8],
    [0,4,8],
    [6,4,2]
]

def won?(board)

  win_combo = true

  WIN_COMBINATIONS.each do |win_combination|

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

    if ((position_1 == "X" && position_2 == "X" && position_3 == "X") || (position_1 == "O" && position_2 == "O" && position_3 == "O"))
       return win_combination.to_ary
     else
       win_combo = false
     end
   end
   return win_combo
end


def full?(board)

    board.all? do |cells|
      if cells == "X" || cells == "O"
        true
      else
        false
      end
    end
end

def draw?(board)
  if ((full?(board) == true) && (won?(board) == false))
    return true
  else
    return false
  end
end

def over?(board)
  if full?(board) || won?(board) || draw?(board)
    true
  end
end

def winner(board)

  if !(won?(board))
    return nil
  elsif board[won?(board)[0]] == "X"
    return "X"
  else board[won?(board)[0]] == "O"
    return "O"
  end
end
