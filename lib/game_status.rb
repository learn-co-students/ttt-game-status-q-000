# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],
                    [0,3,6], [1,4,7], [2,5,8],
                    [0,4,8], [2,4,6]]

def won? (board)
  WIN_COMBINATIONS.detect do |comb|
    board[comb[0]] != " " && board[comb[0]] == board[comb[1]] && board[comb[0]] == board[comb[2]]
   end
end

def full? board
  state = true
  board.each do |cell|
    state &&= cell != " "
  end
  state
end

def draw? board
  full?(board) && !(won? board)
end

def over? board
  draw?(board) || won?(board)
end


def winner board
  begin
    return board[won?(board)[0]]
  rescue
    return nil
  end
end
