# Tic Tac Toe Game Status

## Objectives

1. Define a constant.
2. Create a nested array.
3. Use iteration.
4. Iterate over a nested array.
5. Find matching booleans from an array.
6. Find matching elements from an array.
7. Count matching elements in an array.

## Overview

We'll be building helper methods that introspect and report on the various game states in Tic Tac Toe, including if the game has been `#won?`, if the game board is `#full?`, if the game has been a `#draw?`, if the game is `#over?`, and finally who the `#winner` is.

## Instructions

### 1. Define WIN_COMBINATIONS

The first method to build is `#won?`. In order for that method to function, it will have to know about all the possible winning combinations of Tic Tac Toe.

Tic Tac Toe has 8 possible ways to win: 3 horizontal rows, 3 vertical columns, and 2 diagonals. The game board is represented by an array, `board = [" ", " ", " ", " ", " ", " ", " ", " ", " ",]`, with 9 positions, indexed from 0-8. You could represent the coordinates of a win condition by referring to their index in the `board`. For example a win in the top horizontal row:

```
 X | X | X
-----------
   |   |   
-----------
   |   |   
```

You could represent that as the indexes of the board `[0,1,2]`.

```ruby
# Board with winning X in the top row.
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

# Definition of indexes that compose a top row win.
top_row_win = [0,1,2]

# Check if each index in the top_row_win array contains an "X"
if board[top_row_win[0]] == "X" && board[top_row_win[1]] == "X" && board[top_row_win[2]] == "X"
  "X won in the top row"
end
```

Each win combination could be represented as a 3 element array referring to the indexes in the board that create a win possibility.

Create a nested array of win combinations defined in a constant `WIN_COMBINATIONS` within `lib/game_status.rb`. It's structure should resemble:

```ruby
WIN_COMBINATIONS = [
  [0,1,2], # Top row
  [3,4,5]  # Middle row
  # ETC, an array for each win combination
]
```

Run the tests with `learn` until your `WIN_COMBINATIONS` contains all the possible solutions.

#### What's a CONSTANT

A Constant is a variable type in Ruby that has a larger scope than our local variables, namely, methods can read values from constants defined outside the method. Constants are a variable type for data that is unlikely to change. You can define a constant by starting the variable definition with a capital letter.

### `#won?`

Now that we have a constant that defines the possible win combinations (`WIN_COMBINATIONS`), we can build a method that can check a tic tac toe board and return true if there is a win and false if not.

Your `#won?` method should accept a board as an argument and return false/nil if there is no win combination present in the board and return the winning combination indexes as an array if there is a win. To clarify: this method should __not__ return *who* won (aka X or O), but rather *how* they won -- by means of the winning combination.

Iterate over the possible win combinations defined in `WIN_COMBINATIONS` and check if the board has the same player token in each index of a winning combination. The pseudocode might look like:

```
for each win_combination in WIN_COMBINATIONS
  # win_combination is a 3 element array of indexes that compose a win, [0,1,2]
  # grab each index from the win_combination that composes a win.
  win_index_1 = win_combination[0]
  win_index_2 = win_combination[1]
  win_index_3 = win_combination[2]

  position_1 = board[win_index_1] # load the value of the board at win_index_1
  position_2 = board[win_index_2] # load the value of the board at win_index_2
  position_3 = board[win_index_3] # load the value of the board at win_index_3

  if position_1 == "X" && position_2 == "X" && position_3 == "X"
    return win_combination # return the win_combination indexes that won.
  else
    false
  end
end
```

That is a very verbose and explicit example of how you might iterate over a nested array of `WIN_COMBINATIONS` and check each win combination index against the value of the board at that position.

For example, on a board that has a winning combination in the top row, `#won?` should return `[0,1,2]`, the indexes in the board that created the win:

```ruby
# Board with winning X in the top row.
board = ["X", "X", "X", " ", " ", " ", " ", " ", " "]

won?(board) #=> [0,1,2]
```

A board with a diagonal win would function as follows:

```ruby
# Board with winning X in the right diagonal.
board = ["X", "O", "X", "O", "X", "O", "X", "X", "O"]
#  X | O | X
# -----------
#  O | X | O
# -----------
#  X | X | O

won?(board) #=> [2,4,6]
```

A board with no win would return false/nil:

```ruby
board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]
won?(board) #=> nil
```

You should be able to iterate over the combinations defined in `WIN_COMBINATIONS` using `each` or a higher-level iterator to return the correct board indexes that created the win.

Your method should work for both boards that win with an "X" or boards that win with an "O". We've provided you with a helper method called `position_taken?` that takes a board and an index as arguments and returns true or false based on whether that position on the board has been filled.

```ruby
board = ["X", "X", "X", "O", " ", "O", " ", " ", " "]
#  X | X | X
# -----------
#  O |   | O
# -----------
#    |   |  

position_taken?(board, 2) #=> true
position_taken?(board, 7) #=> false
```

Read the specs in `spec/game_status_spec.rb` starting on LOC 19, the `describe "#won?"` block.

### `#full?`

The `#full?` method should accept a board and return true if every element in the board contains either an "X" or an "O". For example:

```ruby
full_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
full?(full_board) #=> true

incomplete_board = ["X", " ", "X", "O", " ", "X", "O", " ", "O"]
full?(incomplete_board) #=> false
```

The `#full?` method doesn't need to worry about draws or winning combinations, simply return false if there is an available position and true if there is not.

There is a great high-level iterator besides `#each` that will make your code super awesome elegant. But `#each` will certainly work great too.

### `#draw?`

Build a method `#draw?` that accepts a board and returns true if the board has not been won and is full and false if the board is not won and the board is not full, and false if the board is won. You should be able to compose this method solely using the methods you used above with some ruby logic.

You can imagine its behavior:

```ruby
  draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
  draw?(draw_board) #=> true

  x_diagonal_won = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]
  draw?(x_diagonal_won) #=> false

  incomplete_board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]
  draw?(incomplete_board) #=> false
```

### `#over?`

Build a method `#over?` that accepts a board and returns true if the board has been won, is a draw, or is full. You should be able to compose this method solely using the methods you used above with some ruby logic.

```ruby
draw_board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]
over?(draw_board) #=> true

won_board = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]
over?(won_board) #=> true

inprogress_board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]
over?(inprogress_board) #=> false
```

### `#winner`

The `#winner` method should accept a board and return the token, "X" or "O" that has won the game given a winning board.

The `#winner` method can be greatly simplified by using the methods and their return values you defined above.

```ruby
x_win_diagonal = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]
winner(x_win_diagonal) #=> "X"

o_win_center_column = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]
winner(o_win_center_column) #=> "O"

no_winner_board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]
winner(no_winner_board) #=> nil
```

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/ttt-game-status' title='Tic Tac Toe Game Status'>Tic Tac Toe Game Status</a> on Learn.co and start learning to code for free.</p>
