require './Program'
describe Card, "#valid" do
    context "Valid Codes" do
        it "Is a valid code" do
            card = Card.new("6014")
            expect(card.valid).to eq false
        end
    end
end