# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
# require "open-uri"
# require "json"

# def card_fetch(url)
#   JSON.parse(URI.open(url).read)
# end

# card_products = card_fetch("https://vanguardcard.io/api/search.php?limit=500")

# card_products.each do |card|
#   # Legends's role
#   clan_init = CardClan.find_or_create_by(name: card['clan'])

#   if clan_init && clan_init.valid?
#     cards_init = clan_init.cards.create(
#     name: card['name'],
#     card_type: card['type'],
#     power: card['power'],
#     shield: card['shield'],
#     nation: card['nation'],
#     grade: card['grade'],
#     race: card['race'],
#     flavor: card['flavor'],
#     effect: card['effect'],
#     format: card['format'],
#     img: card['image_url']
#     )
#   end
# end
# puts "Created #{Card.count} cards"
# puts "Created #{CardClan.count} clans"AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?
AdminUser.create!(email: 'admin@example.com', password: 'password', password_confirmation: 'password') if Rails.env.development?