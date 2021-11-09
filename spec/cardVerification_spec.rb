require './Program'
describe Card, "#valid" do
    it "Checks that valid Cards are marked as Valid" do
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

describe Card, "#type" do
    it "Checks that Card types are correctly identified" do
        types = {"60141016700078611": "Fly Buys Black", 
            "6014152705006141": "Fly Buys Black", 
            "6014111100033006": "Fly Buys Black", 
            "6014709045001234": "Fly Buys Blue", 
            "6014352700000140": "Fly Buys Red", 
            "6014355526000020": "Fly Buys Green", 
            "6014 3555 2900 0028": "Fly Buys Green",
            "6013111111111111": "Unknown"}

        types.each {|key, value|
            card = Card.new(key)
            expect(card.type).to eq value
        }
    end
end