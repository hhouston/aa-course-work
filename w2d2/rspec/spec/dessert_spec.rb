require 'rspec'
require 'dessert'

=begin
Instructions: implement all of the pending specs (the `it` statements without blocks)! Be sure to look over the solutions when you're done.
=end

describe Dessert do
  let(:chef) { double("chef", name: "hunter") }
  let(:dessert) { Dessert.new("type", 45, chef) }

  describe "#initialize" do
    it "sets a type" do
      expect(dessert.type).to eq("type")
    end
    it "sets a quantity" do
      expect(dessert.quantity).to eq(45)
    end

    it "starts ingredients as an empty array" do
      expect(dessert.ingredients).to be_empty
    end

    it "raises an argument error when given a non-integer quantity" do
      expect { Dessert.new("type", "string", chef) }.to raise_error(ArgumentError)
    end

    it "should test state of chef name" do
      expect(Chef.new("sam").name).to equal("sam")
    end

    it "should test state of chef name2" do
      expect(chef.name).to equal("hunter")
    end
  end

  describe "#add_ingredient" do
    it "adds an ingredient to the ingredients array" do
      dessert.add_ingredient("salt")
      expect( dessert.ingredients ).to match_array(["salt"])
    end
  end

  describe "#mix!" do
    it "shuffles the ingredient array" do
      dessert.add_ingredient("salt")
      dessert.add_ingredient("pepper")
      dessert.add_ingredient("tabasco")
      dessert.add_ingredient("salt")
      dessert.mix!
      expect( dessert.ingredients ).to_not eq(["salt", "pepper", "tabasco", "salt"])

    end
  end

  describe "#eat" do
    it "subtracts an amount from the quantity" do
      dessert.eat(5)
      expect( dessert.quantity ).to eq 40
    end

    it "raises an error if the amount is greater than the quantity" do
      expect { dessert.eat(50)}.to raise_error("not enough left!")
    end
  end

  describe "#serve" do
    it "contains the titleized version of the chef's name" do
      allow(chef).to receive(:titleize).and_return("Chef hunter the Great Baker")
      expect(dessert.serve).to eq("Chef hunter the Great Baker has made 45 types!")
    end
  end

  describe "#make_more" do
    it "calls bake on the dessert's chef with the dessert passed in" do
      expect(chef).to receive(:bake).with(dessert)
      dessert.make_more
    end
  end
end
