require 'hand'


describe Hand do


  let(:two_hearts) { double("two_hearts", value: 2, suit: "Hearts")}

  let(:two_spades) { double("two_spades", value: 2, suit: "Spades")}
  let(:ace_spades) { double("ace_spades", value: 14, suit: "Spades")}
  let(:three_spades) { double("three_spades", value: 3, suit: "Spades")}

  let(:nine_spades) { double("9_spades", value: 9, suit: "Spades")}
  let(:ten_spades) { double("10_spades", value: 10, suit: "Spades")}
  let(:jack_spades) { double("jack_spades", value: 11, suit: "Spades")}
  let(:queen_spades) { double("queen_spades", value: 12, suit: "Spades")}

  let(:king_spades) { double("two_spades", value: 13, suit: "Spades")}
  let(:king_hearts) { double("king_hearts", value: 13, suit: "Hearts")}
  let(:king_diamonds) { double("king_diamonds", value: 13, suit: "Diamonds")}
  let(:king_clubs) { double("king_clubs", value: 13, suit: "Clubs")}

  subject(:new_hand) { Hand.new([two_spades, two_hearts, three_spades, ace_spades, king_spades]) }
  subject(:pair_hand) { Hand.new([two_spades, two_hearts]) }
  subject(:two_pair_hand) { Hand.new([two_spades, two_hearts, king_hearts, king_spades]) }
  subject(:three_pair_hand) { Hand.new([king_diamonds, king_hearts, king_spades, queen_spades]) }
  subject(:four_kind_hand) { Hand.new([king_diamonds, king_hearts, king_spades, king_clubs, two_hearts]) }

  subject(:full_house_hand) { Hand.new([king_diamonds, king_hearts, king_spades, two_spades, two_hearts]) }
  subject(:straight_flush_hand) {Hand.new([ten_spades, jack_spades, queen_spades,king_spades,nine_spades])}

  subject(:royal_flush_hand) {Hand.new([ten_spades, jack_spades, queen_spades,king_spades,ace_spades])}

  describe 'initialize' do
    it 'initialize hand with cards' do
      expect(new_hand.hand).to eq([two_spades, two_hearts, three_spades, ace_spades, king_spades])
    end
  end

  describe 'royal_flush?' do
    it 'returns true when royal flush exists' do
      expect(royal_flush_hand.royal_flush?).to be_truthy
    end

    it 'returns false when given straight flush hand' do
      expect(straight_flush_hand.royal_flush?).to be_falsey
    end
  end

  describe 'straight_flush?' do
    it 'returns true when straight flush exists' do
      expect(royal_flush_hand.straight_flush?).to be_truthy
    end
  end

  describe 'four_a_kind?' do
    it 'returns true with four of a kind' do
      expect(four_kind_hand.four_of_a_kind?).to be_truthy
    end

    it 'returns false with no four of a kind' do
      expect(three_pair_hand.four_of_a_kind?).to be_falsey
    end
  end

  describe 'full_house?' do

    it 'returns true with full house' do
      expect(full_house_hand.full_house?).to be_truthy
    end

    it 'returns false with no full house' do
      expect(three_pair_hand.full_house?).to be_falsey
    end

  end

  describe 'flush' do
    it 'returns true when flsuh exists' do
      expect(royal_flush_hand.flush?).to be_truthy
    end
  end

  describe 'straight?' do
    it 'returns true when straight exists' do
      expect(royal_flush_hand.straight?).to be_truthy
    end
  end

  describe 'three_a_kind?' do
    it 'returns true when three of a king exists' do
      expect(three_pair_hand.three_of_kind?).to be_truthy
    end

  end

  describe 'two_pair?' do
    it "returns true when two pairs exists" do
      expect(two_pair_hand.two_pair?).to be_truthy
    end
  end

  describe 'pair?' do
    it "returns true when a pair exists" do
      expect(pair_hand.pair?).to be_truthy
    end
  end

  describe 'high_card' do
  end



end
