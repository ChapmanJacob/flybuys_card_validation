# Use classes? - Class for a keycard that has its code and type or not bother?
# Check the first few digits with a switch statement in a specific order
# Validate the keycode separately afterwards

# Available types - Black, Red, Green, Blue

# Print out the card type of the provided card number: e.g., 6014 -> Fly Buys Blue
def cardType(cardNumber)
    #TODO COME BACK AND CONVERT TO SWITCH STATEMENT OR SOMETHING
    if cardNumber.match?("601435552[6-9].*")
    #if cardNumber.to_i >= 6014355526 && cardNumber.to_i <= 6014355529 #TODO NOT CORRECT BECAUSE ITS STILL A PREFIX TO THE ACTUAL NUMBER
        print "Fly Buys Green:"
    elsif cardNumber.start_with?("6014352")
        print "Fly Buys Red:" 
    elsif cardNumber.start_with?("60141")
        print "Fly Buys Black:"
    elsif cardNumber.start_with?("6014")
        print "Fly Buys Blue:" 
    else 
        print "Unknown type:"
    end
end


puts "Enter card numbers: "
while true
    cardNumber = gets.chomp

    cardType(cardNumber)

end