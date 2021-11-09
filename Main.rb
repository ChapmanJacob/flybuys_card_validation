# Change filename to Main.rb
require './CardValidator'
puts "Enter card numbers: "
while true
    cardNumber = gets.chomp.delete(" ")
    card = Card.new(cardNumber)
    card.validate
    puts "#{card.type}: #{cardNumber} #{card.valid}" 
end
