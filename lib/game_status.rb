# Helper Method
def position_taken?(board, location)
  !(board[location].nil? || board[location] == " ")
end

# Define your WIN_COMBINATIONS constant

WIN_COMBINATIONS = [
  [0, 1, 2],  
  [3, 4, 5],  
  [6, 7, 8],  
  [0, 3, 6],  
  [1, 4, 7],  
  [2, 5, 8],  
  [2, 4, 6],  
  [0, 4, 8],  
]

def won?(board)
  winner = []
  check_win = -> xs_or_os do
    (winner = xs_or_os; break) if xs_or_os.size == 3 
  end
  
  WIN_COMBINATIONS.each do |combo|
    xs = []
    os = []
    combo.each do |windex|
      position = board[windex]
      case position
      when "X"
        xs << windex
      when "O"
        os << windex
      end 
      check_win.call(xs)
      check_win.call(os)
    end
  end
  (winner.empty?) ? false : winner 
end

def full?(board)
  empties = [" ", "", nil]
  full_board = true
  empties.each { |empty| (full_board = false; break) if board.include?(empty) }
  full_board
end

def draw?(board)
  if won?(board) != false
    false
  elsif full?(board) == false
    false
  else
    true
  end  
end

def over?(board)
  if draw?(board) == true
    true
  elsif won?(board) != false
    true
  elsif full?(board) == false
    false
  end
end

def winner(board)
  if won?(board) == false
    nil
  else
    winning_combo = won?(board)
    winning_square = winning_combo[0]
    (board[winning_square] == "X") ? "X" : "O"
  end
end