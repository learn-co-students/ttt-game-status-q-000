# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end


WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]


def won?(board)
  if "#{board[0]}" == "X" && "#{board[1]}" == "X" && "#{board[2]}" == "X" || "#{board[0]}" == "O" && "#{board[1]}" == "O" && "#{board[2]}" == "O"
  [0, 1, 2]
  elsif "#{board[3]}" == "X" && "#{board[4]}" == "X" && "#{board[5]}" == "X" || "#{board[3]}" == "O" && "#{board[4]}" == "O" && "#{board[5]}" == "O"
  [3, 4, 5]
  elsif "#{board[6]}" == "X" && "#{board[7]}" == "X" && "#{board[8]}" == "X" || "#{board[6]}" == "O" && "#{board[7]}" == "O" && "#{board[8]}" == "O"
  [6, 7, 8]
  elsif "#{board[0]}" == "X" && "#{board[3]}" == "X" && "#{board[6]}" == "X" || "#{board[0]}" == "O" && "#{board[3]}" == "O" && "#{board[6]}" == "O"
  [0, 3, 6]
  elsif "#{board[1]}" == "X" && "#{board[4]}" == "X" && "#{board[7]}" == "X" || "#{board[1]}" == "O" && "#{board[4]}" == "O" && "#{board[7]}" == "O"
  [1, 4, 7]
  elsif "#{board[2]}" == "X" && "#{board[5]}" == "X" && "#{board[8]}" == "X" || "#{board[2]}" == "O" && "#{board[5]}" == "O" && "#{board[8]}" == "O"
  [2, 5, 8]
  elsif "#{board[0]}" == "X" && "#{board[4]}" == "X" && "#{board[8]}" == "X" || "#{board[0]}" == "O" && "#{board[4]}" == "O" && "#{board[8]}" == "O"
  [0, 4, 8]
  elsif "#{board[2]}" == "X" && "#{board[4]}" == "X" && "#{board[6]}" == "X" || "#{board[2]}" == "O" && "#{board[4]}" == "O" && "#{board[6]}" == "O"
  [2, 4, 6]
  end
end


def full?(board)
  board.all? do |position|
    position != " "
  end
end


def draw?(board)
  if "#{board[0]}" == "X" && "#{board[1]}" == "X" && "#{board[2]}" == "X" || "#{board[0]}" == "O" && "#{board[1]}" == "O" && "#{board[2]}" == "O"
  false
  elsif "#{board[3]}" == "X" && "#{board[4]}" == "X" && "#{board[5]}" == "X" || "#{board[3]}" == "O" && "#{board[4]}" == "O" && "#{board[5]}" == "O"
  false
  elsif "#{board[6]}" == "X" && "#{board[7]}" == "X" && "#{board[8]}" == "X" || "#{board[6]}" == "O" && "#{board[7]}" == "O" && "#{board[8]}" == "O"
  false
  elsif "#{board[0]}" == "X" && "#{board[3]}" == "X" && "#{board[6]}" == "X" || "#{board[0]}" == "O" && "#{board[3]}" == "O" && "#{board[6]}" == "O"
  false
  elsif "#{board[1]}" == "X" && "#{board[4]}" == "X" && "#{board[7]}" == "X" || "#{board[1]}" == "O" && "#{board[4]}" == "O" && "#{board[7]}" == "O"
  false
  elsif "#{board[2]}" == "X" && "#{board[5]}" == "X" && "#{board[8]}" == "X" || "#{board[2]}" == "O" && "#{board[5]}" == "O" && "#{board[8]}" == "O"
  false
  elsif "#{board[0]}" == "X" && "#{board[4]}" == "X" && "#{board[8]}" == "X" || "#{board[0]}" == "O" && "#{board[4]}" == "O" && "#{board[8]}" == "O"
  false
  elsif "#{board[2]}" == "X" && "#{board[4]}" == "X" && "#{board[6]}" == "X" || "#{board[2]}" == "O" && "#{board[4]}" == "O" && "#{board[6]}" == "O"
  false
  elsif "#{board[0]}" == " " || "#{board[1]}" == " " || "#{board[2]}" == " " || "#{board[3]}" == " " || "#{board[4]}" == " " || "#{board[5]}" == " " || "#{board[6]}" == " " || "#{board[7]}" == " " || "#{board[8]}" == " "
  false
  else
  true
end
end


def over?(board)
  if "#{board[0]}" == " " || "#{board[1]}" == " " || "#{board[2]}" == " " || "#{board[3]}" == " " || "#{board[4]}" == " " || "#{board[5]}" == " " || "#{board[6]}" == " " || "#{board[7]}" == " " || "#{board[8]}" == " "
  false
  else
  true
  end
end


def winner(board)
  if "#{board[0]}" == "X" && "#{board[1]}" == "X" && "#{board[2]}" == "X" || "#{board[3]}" == "X" && "#{board[4]}" == "X" && "#{board[5]}" == "X" || "#{board[6]}" == "X" && "#{board[7]}" == "X" && "#{board[8]}" == "X" || "#{board[0]}" == "X" && "#{board[3]}" == "X" && "#{board[6]}" == "X" || "#{board[1]}" == "X" && "#{board[4]}" == "X" && "#{board[7]}" == "X" || "#{board[2]}" == "X" && "#{board[5]}" == "X" && "#{board[8]}" == "X" || "#{board[0]}" == "X" && "#{board[4]}" == "X" && "#{board[8]}" == "X" || "#{board[2]}" == "X" && "#{board[4]}" == "X" && "#{board[6]}" == "X"
  "X"
elsif "#{board[0]}" == "O" && "#{board[1]}" == "O" && "#{board[2]}" == "O" || "#{board[3]}" == "O" && "#{board[4]}" == "O" && "#{board[5]}" == "O" || "#{board[6]}" == "O" && "#{board[7]}" == "O" && "#{board[8]}" == "O" || "#{board[0]}" == "O" && "#{board[3]}" == "O" && "#{board[6]}" == "O" || "#{board[1]}" == "O" && "#{board[4]}" == "O" && "#{board[7]}" == "O" || "#{board[2]}" == "O" && "#{board[5]}" == "O" && "#{board[8]}" == "O" || "#{board[0]}" == "O" && "#{board[4]}" == "O" && "#{board[8]}" == "O" || "#{board[2]}" == "O" && "#{board[4]}" == "O" && "#{board[6]}" == "O"
  "O"
else
nil
end
end
# Define your WIN_COMBINATIONS constant
