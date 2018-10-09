require "faraday"

response = Faraday.get("https://api.trello.com/1/boards/LFZoaH46/cards")

require 'json'

cards = JSON.parse(response.body)

cards_infos = []

cards.each do |card_hash|
	card = (card_hash["name"])
	card_id = (card_hash["id"])
	cards_infos += [card_id + ": " + card]

end

if ARGV[0] == "list"
	puts cards_infos
else 
	puts "error"
end

