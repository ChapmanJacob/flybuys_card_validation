# Use classes? - Class for a keycard that has its code and type or not bother?
# Check the first few digits with a switch statement in a specific order
# Validate the keycode separately afterwards

# Available types - Black, Red, Green, Blue

# Print out the card type of the provided card number: e.g., 6014 -> Fly Buys Blue
def cardType(cardNumber)
    #TODO COME BACK AND CONVERT TO SWITCH STATEMENT OR SOMETHING
    if cardNumber.match?("601435552[6-9].*")
        print "Fly Buys Green:"
    elsif cardNumber.match?("6014352.*")
        print "Fly Buys Red:" 
    elsif cardNumber.match?("60141.*")
        print "Fly Buys Black:"
    elsif cardNumber.match?("6014.*")
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