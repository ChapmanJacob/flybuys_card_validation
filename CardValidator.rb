require './Card'
puts "Enter card numbers: "
while true
    cardNumber = gets.chomp.delete(" ")
    Card.new(cardNumber)
end
