require './Program'
describe Card, "#valid" do
    it "Check that valid Cards are marked as Valid" do
        trueValues = ["60141016700078611", "6014111100033006", "6014709045001234", "6014352700000140", "6014355526000020"]

        trueValues.each {|cardNumber|
            card = Card.new(cardNumber)
            expect(card.valid).to eq true
        }
    end
    it "Checks that invalid Cards are marked Invalid" do
        falseValues = ["6014152705006141", "6014 3555 2900 0028", "6013111111111111"]

        falseValues.each {|cardNumber|
            card = Card.new(cardNumber)
            expect(card.valid).to eq false
        }
    end
end