# Use classes? - Class for a keycard that has its code and type or not bother?
# Check the first few digits with a switch statement in a specific order
# Validate the keycode separately afterwards

# Available types - Black, Red, Green, Blue

class Card
    attr_reader :valid
    attr_reader :type
    # Print out the card type of the provided card number: e.g., 6014 -> Fly Buys Blue
    def cardType(cardNumber)
        #TODO COME BACK AND CONVERT TO SWITCH STATEMENT OR SOMETHING
        if cardNumber.match?("601435552[6-9].*")
            @type = "Fly Buys Green"
        elsif cardNumber.match?("6014352.*")
            @type = "Fly Buys Red" 
        elsif cardNumber.match?("60141.*")
            @type = "Fly Buys Black"
        elsif cardNumber.match?("6014.*")
            @type = "Fly Buys Blue" 
        else 
            @type = "Unknown type: "
        end
        print "#{@type}: "
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
            @valid = true
        else 
            puts "Invalid code number"
            @valid = false
        end

    end

    # Initialise this Card with a number and check if its valid or not
    def initialize(cardNumber)
        cardType(cardNumber)
        cardChecksum(cardNumber)
    end
end 