# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
[0,1,2], #Top Row Win
[3,4,5], #Middle Row Win
[6,7,8], #Bottom Row Win
[0,3,6], #Left Column Win
[1,4,7], #Center Column Win
[2,5,8], #Right Column Win
[0,4,8], #Top to Bottom Diagnol Win
[2,4,6] #Bottom to Top Diagnol Win
]

#Define #won? Method here:
def won?(board)

  WIN_COMBINATIONS.each do |a|
    if a.all? {|i| board[i] == "X"} || a.all?{|i| board[i] == "O"} 
     return a
    end
  end
  return false
end

#Define #full? Method here:
def full?(board)
  board.none?{|i| i == " " }
end

#Define #draw? Method here:
def draw?(board)
  if full?(board) == true && won?(board) == false
    return true
  else
    return false
  end
end

#Define #over? method here:
def over?(board)
  if draw?(board) == true || won?(board) != false
    return true
  end
end

#Define #winner method here:
def winner(board)
  if won?(board) == false
    return nil
  end

  a = won?(board)

  if board[a[0]] == "X"
    return "X"
  else 
    return "O"
  end
end
