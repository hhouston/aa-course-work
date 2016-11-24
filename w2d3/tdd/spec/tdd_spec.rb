require 'tdd'

describe Array do

  describe "#my_uniq" do
    it 'removes duplicated' do
      expect([1,2,3,2,1].my_uniq).to eq([1,2,3])
    end

  end

  describe "#two_sum" do
    it 'returns [] if no integers sum to zero' do
      expect([1,4].two_sum).to eq([])
    end

    it 'returns appropriate pairs' do
      expect([-1, 0, 2, -2, 1].two_sum).to eq([[0, 4], [2, 3]])
    end

    it 'does not return element twice' do
      expect([-1, 0, 2, -2, 1].two_sum).to_not eq([[1,1]])
    end

  end

  describe '#transpose' do
    let(:matrix) { [[1,2,6],[3,4,7]]}

    it 'should transpose a matrix' do
      expect(matrix.transpose).to eq([[1,3],[2,4],[6,7]])
    end
  end


  describe '#stock_prices' do

    let(:stock_array) { [7,3,5,10] }

    it 'should return the best day to buy then sell stock' do
      expect(stock_array.stock_picker).to eq([1,3])
    end

    it 'only decreasing' do
      expect([10, 8, 6, 4].stock_picker).to be_nil
    end

    it 'buy date better than sell date' do
      expect([7, 3, 5, 10, 1].stock_picker). to eq([1,3])
    end
  end
end

describe TowersOfHanoi do
  subject(:game) { TowersOfHanoi.new([1,2,3]) }

  describe '#initialize' do

    it 'should set stacks' do
      expect(game.stacks[0]).to eq([1,2,3])
      expect(game.stacks[1]).to eq([])
      expect(game.stacks[2]).to eq([])
    end

  end


  describe '#move_disc' do
    it 'should move disc' do
      game.move_disc(0, 1)
      expect(game.stacks[1]).to eq([1])
    end

    it 'catches error' do
      expect { game.move_disc("a", "b") }.to raise_error("Not a stack")
    end

    it 'receives valid_moves' do
      expect(game).to receive(:valid_move?).with(0,1)
      game.move_disc(0,1)
    end

  end

  describe '#valid_move?' do
    it 'should return true if move is valid' do
      expect(game.valid_move?(0,1)).to be_truthy
    end

    it 'should return false trying to move an empty stack' do
      expect(game.valid_move?(2,1)).to be_falsey
    end

    it 'should return false trying to place larger disc on smaller disc' do
      game.move_disc(0,1)
      expect(game.valid_move?(0,1)).to be_falsey
    end


  end

  describe '#won?' do

    it 'returns true when stack one plus another are empty' do
      game.move_disc(0,1)
      game.move_disc(0,2)
      game.move_disc(1,2)
      game.move_disc(0,1)
      game.move_disc(2,0)
      game.move_disc(2,1)
      game.move_disc(0,1)
      expect(game.won?).to be_truthy
    end

    it 'returns false when game is not over' do
      game.move_disc(0,2)
      expect(game.won?).to be_falsey
    end

  end

end
