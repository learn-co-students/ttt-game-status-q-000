    # win_index_1 = item[0]
       # win_index_2 = item[1]
       # win_index_3 = item[2]

       #  if board.none?{|element| element == "X" || element == "O"}
       #    return false
       #  elsif draw?(board) 
       #    return false 	
       #  elsif position_taken?(board, win_index_1) && position_taken?(board, win_index_2) && position_taken?(board, win_index_3)
       #     position_1 = board[win_index_1]
       #     position_2 = board[win_index_2]
       #     position_3 = board[win_index_3]
       
       #      if (position_1 == "X" || "O") && (position_2 == "X" || "O") && (position_3 == "X" || "O")
       # 	       return item
       #      end  
       #  end


       board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
def won?(board)
  WIN_COMBINATIONS.each do |win_combinations|
    if ((board[win_combinations[0]] == "X" && board[win_combinations[1]] == "X" && board[win_combinations[2]] == "X"))
      return win_combinations
    elsif
      ((board[win_combinations[0]] == "O" && board[win_combinations[1]] == "O" && board[win_combinations[2]] == "O"))
      return win_combinations
end
end
else false
end

  # if board[item[0]] == "X" && board[item[1]] == "X" && board[item[2]] == "X"
    #   return item
    # elsif board[item[0]] == "O" && board[item[1]] == "O" && board[item[2]] == "O"
    #   return item
    # end