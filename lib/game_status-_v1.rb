# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[2,4,6]]
Characters = ["X","O"]

# v4. the sad, non-elegant solution

def won?(board)
  o_streak = o_won?(board) 
  x_streak = x_won?(board)
  if x_streak == nil && o_streak == nil
    streak = nil
  elsif x_streak != nil
    streak = x_streak
  elsif o_streak != nil
    streak = o_streak
  end
  streak
end

def o_won?(board)
  WIN_COMBINATIONS.detect do |win|
    win.all? do |square|
      board[square] == "O"
    end
  end 
end 

def x_won?(board)
  WIN_COMBINATIONS.detect do |win|
    win.all? do |square|
      board[square] == "X"
    end
  end 
end 

def full?(board)
  board.none? do |spot|
    spot == " "
  end
end

def draw?(board)
  if full?(board) == true && won?(board) == nil
    true
  end
end

def over?(board)
  if won?(board) != nil || draw?(board) == true
    true
  end
end

def winner(board)
  if draw?(board) == true
    nil
    elsif o_won?(board) != nil
      "O"
      elsif x_won?(board) != nil
        "X"     
  end
end

# v3. correctly detects O wins but not X wins;
#     it's because the cycle for O overrides 
#     the results from the cycle for X
#
# def won?(board)
#   characters = ["X","O"]
#   x = 0
#   while x < characters.length  
#     streak = WIN_COMBINATIONS.detect do |combination|
#       combination.all? do |square|
#         board[square] == characters[x]
#       end 
#     end
#     x += 1
#   end   
#   puts "This is it: #{streak}"
# end

# v2. worked when we were just testing X;
#     detect is good b/c it returns an array,
#     not a nested array
#
# def won?(board)
#   WIN_COMBINATIONS.detect do |win|
#     win.all? do |square|
#       board[square] == "X"
#     end
#   end
# end

# v1. worked when I was returning a boolean
#
# def won?(board)
#   WIN_COMBINATIONS.any? do |win|
#     win.all? do |square|
#       board[square] == "X"
#     end
#   end
# end