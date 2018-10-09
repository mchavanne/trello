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

require_relative "secrets"

if ARGV[0] == "list"
	puts cards_infos
elsif ARGV[0] == "create"
	response = Faraday.post("https://api.trello.com/1/cards?",
	{"key" => API_KEY, "token" => API_TOKEN, "name"=> ARGV[1], "desc" => ARGV[2], "idList" => "5bb39ee0029f335fb88aa2a9"})
	puts "New card created"
elsif ARGV[0] == "delete"
	response = Faraday.delete("https://api.trello.com/1/cards/" + ARGV[1],
	{"key" => API_KEY, "token" => API_TOKEN})
	puts "Card deleted"
else 
	puts "error"

end
