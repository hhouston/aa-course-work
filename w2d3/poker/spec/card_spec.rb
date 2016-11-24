require 'card.rb'

describe Card do
  let (:card) {Card.new("Spades",14)}
  describe '#initialize' do

    it 'should set value and suit when created' do
      expect(card.value).to eq(14)
      expect(card.suit).to eq("Spades")
    end

    it 'should raise error if wrong suit is created' do
      expect { Card.new("spoon", 14)}.to raise_error("Invalid suit")
    end

    it 'should raise error if wrong value is created' do
      expect { Card.new("Spades", 18)}.to raise_error("Invalid value")
    end

  end
end
