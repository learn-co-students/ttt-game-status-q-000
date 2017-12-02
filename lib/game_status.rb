# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

def won?(board)
    WIN_COMBINATIONS.each do |win_combo|
        win_index_1 = win_combo[0]
        win_index_2 = win_combo[1]
        win_index_3 = win_combo[2]

        board_position_1 = board[win_index_1]
        board_position_2 = board[win_index_2]
        board_position_3 = board[win_index_3]

        if board_position_1 == "X" && board_position_2 == "X" && board_position_3 == "X"
            return win_combo
        elsif board_position_1 == "O" && board_position_2 == "O" && board_position_3 == "O"
            return win_combo
        end
    end
    false
end

def full?(board)
    board.all? do |cell|
        cell == "X" || cell == "O"
    end
end

def draw?(board)
    game_won = won?(board)
    if game_won != false
        return false
    end
    board_full = full?(board)
end

def over?(board)
    game_won = won?(board)
    game_draw = draw?(board)
    puts "game_won: #{game_won}"
    puts "game_draw: #{game_draw}"

    if game_won == false && game_draw == false
        board_full = full?(board)
        puts "board_full: #{board_full}"
        if board_full == true
            return true
        else
            return false
        end
    else
        return true
    end
end

def winner(board)
    game_won = won?(board)
    if game_won == false
        return nil
    else
        winner_index = game_won[0]
        return board[winner_index]
    end
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
]
