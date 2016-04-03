# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [

  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [6,4,2]

]

def won?(board)

  WIN_COMBINATIONS.detect do |win_combination|

    #Ask why select didn't work? Why does first time matter? Why would select not find the first win?

    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]  
   
    if
      position_1 == "X" && position_2 == "X" && position_3 == "X" || position_1 == "O" && position_2 == "O" && position_3 == "O" 

    ["win_combination[0]", "win_combination[1]", "win_combination[2]"]
    
    else
    
    false
    
    end

  end


end


def full?(board)
  board.none? {|space| space == " "}
end

def draw?(board)
  
  board.none? {|space| space == " "} && !won?(board)

end

def over?(board)
  board.none? {|space| space == " "}
  board.none? {|space| space == " "}
end

def winner(board)

  WIN_COMBINATIONS.detect do |win_combination|

  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1]
  position_2 = board[win_index_2]
  position_3 = board[win_index_3]  
   
    if
      position_1 == "X" && position_2 == "X" && position_3 == "X" 

      "X"

    elsif position_1 == "O" && position_2 == "O" && position_3 == "O" 

      "O"

    else 

      nil

    end    
  end
end