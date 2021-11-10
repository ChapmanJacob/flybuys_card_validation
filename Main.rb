# Change filename to Main.rb
require './card_validator'
while true
  puts 'Enter card number: '
  cardNumber = gets.chomp.delete(" ")
  card = CardValidator.new(cardNumber)
  card.validate
  puts "#{card.type}: #{cardNumber} #{card.valid}"
end
