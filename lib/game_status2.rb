# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0,1,2],[3,4,5],[6,7,8],[0,3,6],[1,4,7],[2,5,8],[0,4,8],[6,4,2]]
def same_values?
  self.uniq.length == 1
end
def won?(board)
  eval=Array.new(8) {Array.new(3,"")}
  count=[0,1,2,3,4,5,6,7]
  count2=[0,1,2]
  count.each do |counter|
    count2.each do |counter2|
      eval[counter][counter2]=board[WIN_COMBINATIONS[counter][counter2]]
    end
    if eval[counter].same_values?
      puts "winner at #{WIN_COMBINATIONS[counter][counter2]}"
    end
  end
  if winner==[" "," "," "]
    false
  end
end
board = ["X", "O", "X", "X", "X", "X", "X", "X", "O"]

winner=won?(board)

__END__

puts "winner is #{winner}"
eval.any? do |combo|
  if combo.same_values?
    winner=combo
    puts "winner after evalany is #{winner}"
