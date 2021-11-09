class Card
    attr_reader :valid
    attr_reader :type

    # Print out the card type of the provided card number: e.g., 6014 -> Fly Buys Blue
    def cardType(cardNumber)
        if cardNumber.match?("601435552[6-9].*") && cardNumber.length == 16
            @type = "Fly Buys Green"
        elsif cardNumber.match?("6014352.*") && cardNumber.length == 16
            @type = "Fly Buys Red" 
        elsif cardNumber.match?("60141.*") && cardNumber.length.between?(16, 17)
            @type = "Fly Buys Black"
        elsif cardNumber.match?("6014.*") && cardNumber.length == 16
            @type = "Fly Buys Blue" 
        else 
            @type = "Unknown"
        end
        print "#{@type}: #{cardNumber} "
    end

    # Calculate the checksum for the provided checksum and output if the card is valid or not
    def cardChecksum(cardNumber)
        cardArray = cardNumber.to_s.split("")

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
            puts "(valid)"
            @valid = true
        else 
            puts "(invalid)"
            @valid = false
        end
    end

    # Initialise this Card with a number and check if its valid or not
    def initialize(cardNumber)
        cardNumber = cardNumber.to_s.delete(" ") # Remove whitespaces
        cardType(cardNumber)
        cardChecksum(cardNumber)
    end
end 