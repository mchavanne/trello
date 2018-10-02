require "faraday"

response = Faraday.get("https://api.trello.com/1/boards/LFZoaH46/cards")

require 'json'

cards = JSON.parse(response.body)

cards_infos = []

cards.each do |card_hash|
	card = (card_hash["name"])
	card_desc = (card_hash["desc"])
	cards_infos += [card,card_desc]

end

puts cards_infos
