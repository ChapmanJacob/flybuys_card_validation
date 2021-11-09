# Use classes? - Class for a keycard that has its code and type or not bother?
# Check the first few digits with a switch statement in a specific order
# Validate the keycode separately afterwards

# Available types - Black, Red, Green, Blue

# Print out the card type of the provided card number: e.g., 6014 -> Fly Buys Blue
def cardType(cardNumber)
    #TODO COME BACK AND CONVERT TO SWITCH STATEMENT OR SOMETHING
    if cardNumber.match?("601435552[6-9].*")
        print "Fly Buys Green: "
    elsif cardNumber.match?("6014352.*")
        print "Fly Buys Red: " 
    elsif cardNumber.match?("60141.*")
        print "Fly Buys Black: "
    elsif cardNumber.match?("6014.*")
        print "Fly Buys Blue: " 
    else 
        print "Unknown type: "
    end
end

# Calculate the checksum for the provided checksum and output if the card is valid or not
def cardChecksum(cardNumber)
    cardArray = cardNumber.split("")

    # Start at next to last digit, and every second digit, double the digit    
    negativeIndex = 2
    loop {
        break if negativeIndex > cardArray.length
        cardArray[cardArray.length - negativeIndex] = cardArray[cardArray.length - negativeIndex].to_i * 2
        negativeIndex += 2
    }

    # Total up all the digits in the array and if one is above 10, split it into 2 digits and add them
    total = 0
    cardArray.each {|digit|
        if digit.to_i > 9
            total += 1 + (digit.to_i - 10)
        else
            total += digit.to_i
        end
    }

    # Output result
    if total % 10 == 0
        puts "Valid card number"
    else 
        puts "Invalid code number"
    end

end

puts "Enter card numbers: "
while true
    cardNumber = gets.chomp

    cardType(cardNumber)
    cardChecksum(cardNumber)
end