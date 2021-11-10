# Change filename to Main.rb
require './card_validator'
puts "Enter card numbers: "
while true
  cardNumber = gets.chomp.delete(" ")
  card = CardValidator.new(cardNumber)
  card.validate
  puts "#{card.type}: #{cardNumber} #{card.valid}" 
end