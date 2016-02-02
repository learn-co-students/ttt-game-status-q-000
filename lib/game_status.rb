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

  position_1=""
  position_2=""
  position_3=""

  position_4=""
  position_5=""
  position_6=""

  WIN_COMBINATIONS.each  do|win_combination|
    win_combination.each do|win_combination_index|
      win_index_1 = win_combination[0]
      win_index_2 = win_combination[1]
      win_index_3 = win_combination[2]


      position_1 = board[win_index_1]
      position_2 = board[win_index_2]
      position_3 = board[win_index_3]

      win_index_4 = win_combination[3]
      win_index_5 = win_combination[4]
      win_index_6 = win_combination[5]


      position_4 = board[win_index_4.to_i]
      position_5 = board[win_index_5.to_i]
      position_6 = board[win_index_6.to_i]
    end

     if (( position_1 == "X" && position_2 == "X" && position_3 == "X") || ( position_4 == "X" && position_5 == "X" && position_6 == "X"))
       puts "return combinations  are  #{win_combination}"
       return  win_combination

       else

      return false
    end

end

end


 won?(board)
