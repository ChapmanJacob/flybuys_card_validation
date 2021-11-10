require './card_validator'
describe CardValidator do
  describe "#validate" do
    context "When provided with a valid card number" do
      it "returns true" do
        trueValues = ["60141016700078611", "6014111100033006", "6014709045001234", "6014352700000140", "6014355526000020"]

        trueValues.each do |cardNumber|
          card = CardValidator.new(cardNumber)
          card.validate
          expect(card.valid).to eq true
        end
      end
    end
    context "When provided with an invalid card number" do
      it "returns false" do
        falseValues = ["6014152705006141", "6014 3555 2900 0028", "6013111111111111", "60143527daves140"]

        falseValues.each do |cardNumber|
          card = CardValidator.new(cardNumber)
          card.validate
          expect(card.valid).to eq false
        end
      end
    end
  end

  describe "#card_type" do
    context "When provided with a card number" do
      it "identifies the correct card type" do
        types = {"60141016700078611": "Fly Buys Black", 
          "6014152705006141": "Fly Buys Black", 
          "6014111100033006": "Fly Buys Black", 
          "6014709045001234": "Fly Buys Blue", 
          "6014352700000140": "Fly Buys Red", 
          "6014355526000020": "Fly Buys Green", 
          "6014 3555 2900 0028": "Fly Buys Green",
          "6013111111111111": "Unknown"}

          types.each do |key, value|
            card = CardValidator.new(key)
            card.validate
            expect(card.type).to eq value
          end
      end
    end
  end
end
