# Initial Feedback:
# Potentially name this CardValidator instead of Card
# Move the attr_readers into one line
# Initialize card with a number as a field and allow the user to call the specific methods if they want 
#   the results instead of just setting fields in the initialize method

# CardType:
# Use \d instead of . 
# Use range based instead of *
# Change cardType to only accept digits in the regex checks - also change the Checksum to only accept numbers
# Move prints into the Main 


# Separate public facing method that starts the validation or just one of the two checks or something like a usecase
# make methods private if unused externally
# Do end instead of {} for multi line blocks


# snake case method names and parameters

# card_checksum:
# Break into multiple methods - one for each of the 3 stages


class CardValidator
  attr_reader :valid, :type # Use one line

  # Initialise this Card with a number and check if its valid or not
  def initialize(cardNumber)
    @cardNumber = cardNumber.to_s.delete(" ") # Remove whitespaces
  end

  def validate
    card_type
    card_checksum
  end

  private
  # Print out the card type of the provided card number: e.g., 6014 -> Fly Buys Blue
  def card_type
    if @cardNumber.match?(/601435552[6-9]\d{6}/) 
      @type = "Fly Buys Green"
    elsif @cardNumber.match?(/6014352\d{8}/)
      @type = "Fly Buys Red" 
    elsif @cardNumber.match?(/60141\d{11,12}/)
      @type = "Fly Buys Black"
    elsif @cardNumber.match?(/6014\d{12}/)
      @type = "Fly Buys Blue" 
    else 
      @type = "Unknown"
    end
  end

  # Calculate the checksum for the provided checksum and output if the card is valid or not
  def card_checksum
    cardArray = @cardNumber.to_s.split("")

    unless check_digits(cardArray)
      @valid = false
      return
    end

    double_digits(cardArray)
    total = total_array(cardArray)

    # Simpler Validation
    @valid = total % 10 == 0
  end

  # Start at next to last digit, and every second digit, double the digit  
  def double_digits(cardArray)  
    negativeIndex = 2
    loop do
      break if negativeIndex > cardArray.length
      cardArray[cardArray.length - negativeIndex] = cardArray[cardArray.length - negativeIndex].to_i * 2
      negativeIndex += 2
    end
  end

  # Total up all the digits in the array and if one is above 10, split it into 2 digits and add them
  def total_array(cardArray)
    total = 0
    cardArray.each do |digit|
      if digit.to_i > 9
        total += 1 + (digit.to_i - 10)
      else
        total += digit.to_i
      end
    end 
    return total
  end

  # Check for letters in the input
  def check_digits(cardArray)
    cardArray.each do |character|
      return false if character.match?(/\D/)
    end
  end
end 