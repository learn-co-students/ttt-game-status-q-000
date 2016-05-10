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
       [2,4,6]
]


board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

def won?(board)
  WIN_COMBINATIONS.detect do | win_combination |
    win_index_1 = win_combination[0]
    win_index_2 = win_combination[1]
    win_index_3 = win_combination[2]

    position_1 = board[win_index_1]
    position_2 = board[win_index_2]
    position_3 = board[win_index_3]

     if position_1 ==  position_2 && position_2 ==  position_3 && position_1 != " "
       return win_combination
     else
       false
     end
   end
 end



def full?(board)
  board.none? do |position|
     position == " "
  end
end



def draw?(board)
 !won?(board) && full?(board)
end

def over?(board)
   won?(board) || draw?(board)
 end

 def winner(board)
   win_combination = won?(board)
   if win_combination
    win_index = win_combination[0]
    board[win_index]
   end
 end
