# Use classes? - Class for a keycard that has its code and type or not bother?
# Check the first few digits with a switch statement in a specific order
# Validate the keycode separately afterwards

# Available types - Black, Red, Green, Blue

# Save the number ranges in a hash or something? - Some are just the starting value and one of them is a specified range - might be hard

puts "Enter card numbers: "
while true
    cardNumber = gets.chomp

    if cardNumber.to_i >= 6014355526 && cardNumber.to_i <= 6014355529
        puts "Fly Buys Green"
    elsif cardNumber.start_with?("6014352")
        puts "Fly Buys Red" 
    elsif cardNumber.start_with?("60141")
        puts "Fly Buys Black"
    elsif cardNumber.start_with?("6014")
        puts "Fly Buys Blue" 
    end

end