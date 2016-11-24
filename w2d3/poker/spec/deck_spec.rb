require 'deck'

describe Deck do
  let(:new_deck) { Deck.new }

  describe 'initialize' do
    it 'should have deck with 52 cards' do
      expect(new_deck.deck.length).to eq(52)
    end

    it 'should not have the same card twice' do
      values = new_deck.deck.map { |val| val }
      suits = new_deck.deck.map { |suite| suite }

      expect(values.uniq).to eq(values)
      expect(suits.uniq).to eq(suits)
    end


  end

  describe 'shuffle' do
    it 'should shuffle deck to a random order' do
      expect(new_deck.shuffle).to_not eq(new_deck)
    end
  end

  describe 'deal' do
    it 'should deal card at the top of the deck' do
      top_card = new_deck.deck.first
      discard = new_deck.deal
      expect(new_deck.deck.first).to_not eq(top_card)
      expect(discard).to eq(top_card)
    end

    it 'should raise error if out of cards' do
      52.times do
        new_deck.deal
      end

      expect{ new_deck.deal }.to raise_error("deck empty")
    end

  end


end
