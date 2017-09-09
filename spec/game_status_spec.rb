require_relative '../lib/game_status.rb'

describe "./lib/game_status.rb" do
  describe 'WIN_COMBINATIONS' do
    it 'defines a constant WIN_COMBINATIONS with arrays for each win combination' do
      expect(WIN_COMBINATIONS.size).to eq(8)

      expect(WIN_COMBINATIONS).to include_array([0,1,2])
      expect(WIN_COMBINATIONS).to include_array([3,4,5])
      expect(WIN_COMBINATIONS).to include_array([6,7,8])
      expect(WIN_COMBINATIONS).to include_array([0,3,6])
      expect(WIN_COMBINATIONS).to include_array([1,4,7])
      expect(WIN_COMBINATIONS).to include_array([2,5,8])
      expect(WIN_COMBINATIONS).to include_array([0,4,8])
      expect(WIN_COMBINATIONS).to include_array([6,4,2])
    end
  end

  describe "#won?" do
    it 'returns false for an empty board' do
      board = [" ", " ", " ", " ", " ", " ", " ", " ", " "]

      expect(won?(board)).to be_falsey
    end

    it 'returns false for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(won?(board)).to be_falsey
    end

    it 'returns an array of matching indexes for a top row win' do
      board = ["X", "X", "X", "O", "O", " ", " ", " ", " "]

      expect(won?(board)).to match_array([0,1,2])
    end

    it 'returns an array of matching indexes for a middle row win' do
      board = ["O", "O", " ", "X", "X", "X", " ", " ", " "]

      expect(won?(board)).to match_array([3,4,5])
    end

    it 'returns an array of matching indexes for a bottom row win' do
      board = [" ", " ", " ", "O", "O", " ", "X", "X", "X"]

      expect(won?(board)).to match_array([6,7,8])
    end

    it 'returns an array of matching indexes for a left column win' do
      board = ["O", " ", "X", "O", " ", "X", "O", " ", " "]

      expect(won?(board)).to match_array([0,3,6])
    end

    it 'returns an array of matching indexes for a middle column win' do
      board = ["X", "O", " ", "X", "O", " ", " ", "O", " "]

      expect(won?(board)).to match_array([1,4,7])
    end

    it 'returns an array of matching indexes for a right column win' do
      board = ["X", " ", "O", "X", " ", "O", " ", " ", "O"]

      expect(won?(board)).to match_array([2,5,8])
    end

    it 'returns an array of matching indexes for a left diagonal win' do
      board = ["X", " ", "O", " ", "X", "O", " ", " ", "X"]

      expect(won?(board)).to match_array([0,4,8])
    end

    it 'returns an array of matching indexes for a right diagonal win' do
      board = ["X", " ", "O", "X", "O", " ", "O", " ", " "]

      expect(won?(board)).to match_array([2,4,6])
    end
  end

  describe '#full?' do
    it 'returns true for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(full?(board)).to be_truthy
    end

    it 'returns false for an in-progress game' do
      board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(full?(board)).to be_falsey
    end
  end

  describe '#draw?' do
    it 'returns true for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(draw?(board)).to be_truthy
    end

    it 'returns false for a game won in the first row' do
      board = ["X", "X", "X", "O", "X", "O", "O", "O", "X"]

      expect(draw?(board)).to be_falsey
    end

    it 'returns false for a won game diagonaly' do
      board = ["X", "O", "X", "O", "X", "O", "O", "O", "X"]

      expect(draw?(board)).to be_falsey
    end

    it 'returns false for an in-progress game' do
      board = ["X", " ", "X", " ", "X", " ", "O", "O", "X"]

      expect(draw?(board)).to be_falsey
    end
  end

  describe '#over?' do
    it 'returns true for a draw' do
      board = ["X", "O", "X", "O", "X", "X", "O", "X", "O"]

      expect(over?(board)).to be_truthy
    end

    it 'returns true for a won game when the board is full' do
      board = ["X", "O", "X", "O", "X", "X", "O", "O", "X"]

      expect(over?(board)).to be_truthy
    end

    it 'returns true for a won game when the board is not full' do
      board = ["X", " ", " ", "O", "O", "O", "X", "X", " "]

      expect(over?(board)).to be_truthy
    end

    it 'returns false for an in-progress game' do
      board = ["X", " ", "X", " ", "X", " ", "O", "O", " "]

      expect(over?(board)).to be_falsey
    end
  end

  describe '#winner' do
    it 'return X when X won' do
      board = ["X", " ", " ", " ", "X", " ", " ", " ", "X"]

      expect(winner(board)).to eq("X")
    end

    it 'returns O when O won' do
      board = ["X", "O", " ", " ", "O", " ", " ", "O", "X"]

      expect(winner(board)).to eq("O")
    end

    it 'returns nil when no winner' do
      board = ["X", "O", " ", " ", " ", " ", " ", "O", "X"]

      expect(winner(board)).to be_nil
    end
  end
end
