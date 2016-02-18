# Helper Method
board = ["X", "X", "X", "X", "X", "X", " ", " ", " "]


# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS =[
  [ 0 , 1 , 2  ] , # top row
  [ 3 , 4 , 5  ] , # middle row
  [ 6 , 7 , 8  ] , # bottom row
  [ 0 , 3 , 6  ] , # left column
  [ 1 , 4 , 7  ] , # middle  column
  [ 2 , 5 , 8  ] , # right  column
  [ 0 , 4 , 8  ] , # diagonal left to right
  [ 2 , 4 , 6  ]  # diagonal  right to left
 ]


def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

def  won?(board)

    win_index_1=0
    win_index_2=0
    win_index_3=0
    win_index_4=0
    win_index_5=0
    win_index_6=0
    win_index_7=0
    win_index_8=0
    win_index_9=0

    position_1=""
    position_2=""
    position_3=""
    position_4=""
    position_5=""
    position_6=""
    position_7=""
    position_8=""
    position_9=""




  WIN_COMBINATIONS.each  do|win_combination|


    win_combination.each do|win_combination_index|

      win_index_1 = win_combination_index[0]
      win_index_2 = win_combination_index[1]
      win_index_3 = win_combination_index[2]
      win_index_4 = win_combination_index[3]
      win_index_5 = win_combination_index[4]
      win_index_6 = win_combination_index[5]
      win_index_7 = win_combination_index[6]
      win_index_8 = win_combination_index[7]
      win_index_9 = win_combination_index[8]
      puts " win_index_inner :  #{win_index_1}   #{win_index_2}   #{win_index_3}   #{win_index_4}   #{win_index_5}   #{win_index_6}   #{win_index_7}   #{win_index_8}  "
    end
      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]
      position_4 = board[win_index_4]
      position_5 = board[win_index_5]
      position_6 = board[win_index_6]
      position_7 = board[win_index_9]
      position_8 = board[win_index_8]
      position_9 = board[win_index_9]
    puts " win_index_outer :  #{win_index_1}   #{win_index_2}   #{win_index_3}   #{win_index_4}   #{win_index_5}   #{win_index_6}   #{win_index_7}   #{win_index_8}  "
  end

     if ( position_1 == "X" && position_2 == "X" && position_3 == "X")
       return [win_index_1 ,win_index_2,win_index_3]
     elseif  ( position_4 == "X" && position_5 == "X" && position_6 == "X")
       puts "return combinations  are  #{win_combination}"
        return [win_index_4 ,win_index_5,win_index_6]
     else

      return false
    end
  


end


 won?(board)
