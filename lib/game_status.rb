# Helper Method
draw_stat = false
winner = false

def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5],  # Middle row
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
  # ETC, an array for each win combination
]

def won?(board)
  for combination in WIN_COMBINATIONS
    #combination represents a 3-element array of indices that comprise a win
    #There are 8 possible combinations that satisfy this criterion
    #grab each index from the combination that comprises a win
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1] #load the value of the board at win_index_1
    position_2 = board[win_index_2] #load the value of the board at win_index_2
    position_3 = board[win_index_3] #load the value of the board at win_index_3

    if (position_1 == "X" && position_2 == "X" && position_3 == "X") or (position_1 == "O" && position_2 == "O" && position_3 == "O")
      #winner = true
      #winner = false
      #draw_stat = false
      #false
      return combination #return the combination indexes that won
      break
    #else
      #winner = false
      #false
    end
    cnt = 0  
  end
    board.each do |i|
      if i != " "
        cnt = cnt + 1
      end
    end  
      if cnt == 0
        return false
      end
      if cnt == 9 #and winner == false
        #draw_stat = true
        return false
      end  
end

def full?(board)
  count = 0
  for j in 0..8 do
    #puts "the value of board[j] = #{board[j]}"
    if board[j] == "X" or board[j] == "O"
      count = count + 1
      #puts "the count is currently #{count}"
    end
  end
 # puts "the count is #{count}"

  if count == 9
   # puts "this returns TRUE"
    return true
  end

  if count < 9
   # puts "this returns FALSE"
    false
  end
end  

def draw?(board)
   cnt = 0
   board.each do |i|
    if i != " "
      cnt = cnt + 1
    end
  end  
  if cnt < 9
    return false
  end  
  WIN_COMBINATIONS.each do |combination|
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1] #load the value of the board at win_index_1
    position_2 = board[win_index_2] #load the value of the board at win_index_2
    position_3 = board[win_index_3] #load the value of the board at win_index_3
    if (position_1 == "X" && position_2 == "X" && position_3 == "X") or (position_1 == "O" && position_2 == "O" && position_3 == "O")
      return false
    end  
    #puts position_1 + position_2 + position_3
  end  
 # count = 0
  #board.each {|i| puts "Element was: #{i}"}
end

def over?(board)
   
  if draw?(board)
    return true
  end

  if won?(board)
    return true
  end

  if not full?(board)
    if not won?(board)

      return false
    end  
  end 
end  

def winner(board)
    WIN_COMBINATIONS.each do |combination|
   
    win_index_1 = combination[0]
    win_index_2 = combination[1]
    win_index_3 = combination[2]

    position_1 = board[win_index_1] #load the value of the board at win_index_1
    position_2 = board[win_index_2] #load the value of the board at win_index_2
    position_3 = board[win_index_3] #load the value of the board at win_index_3

    puts position_1 + position_2 + position_3
    
    if (position_1 == "X" && position_2 == "X" && position_3 == "X")
        return "X"
        break
    end

    if (position_1 == "O" && position_2 == "O" && position_3 == "O") 
        return "O"
        break
    end    
  end
  return nil
end  

#won?(board = [" ", " ", " ", " ", " ", " ", " ", " ", " "])