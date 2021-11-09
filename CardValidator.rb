require './Program'
puts "Enter card numbers: "
while true
    cardNumber = gets.chomp
    Card.new(cardNumber)
end
