# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
require "open-uri"
require "json"
require "faker"

Card.destroy_all
CardClan.destroy_all
Province.destroy_all

provinces = [
  { name: "Alberta", provincial: "0.00", goods_and_services: "0.05",
harmonized: "0.00" },
  { name: "British Columbia", provincial: "0.07", goods_and_services: "0.05",
harmonized: "0.00" },
  { name: "Manitoba", provincial: "0.07", goods_and_services: "0.05",
harmonized: "0.00" },
  { name: "New Brunswick", provincial: "0.00", goods_and_services: "0.00",
harmonized: "0.15" },
  { name: "Newfoundland and Labrador", provincial: "0.00", goods_and_services: "0.00",
harmonized: "0.15" },
  { name: "Northwest Territories", provincial: "0.00", goods_and_services: "0.05",
harmonized: "0.00" },
  { name: "Nova Scotia", provincial: "0.00", goods_and_services: "0.00",
harmonized: "0.15" },
  { name: "Nunavut", provincial: "0.00", goods_and_services: "0.05",
harmonized: "0.00" },
  { name: "Ontario", provincial: "0.00", goods_and_services: "0.00",
harmonized: "0.13" },
  { name: "Prince Edward Island", provincial: "0.00", goods_and_services: "0.00",
harmonized: "0.15" }
]

provinces.each do |province|
  Province.create(
    name: province[:name],
    pst:  province[:provincial],
    gst:  province[:goods_and_services],
    hst:  province[:harmonized]
  )
end

def card_fetch(url)
  JSON.parse(URI.open(url).read)
end

card_products = card_fetch("https://vanguardcard.io/api/search.php?limit=500")

card_products.each do |card|
  # Card clans
  clan_init = CardClan.find_or_create_by(name: card["clan"])

  next unless clan_init&.valid?

  cards_init = clan_init.cards.create(
    name:      card["name"],
    card_type: card["type"],
    power:     card["power"],
    shield:    card["shield"],
    nation:    card["nation"],
    grade:     card["grade"],
    race:      card["race"],
    flavor:    card["flavor"],
    effect:    card["effect"],
    format:    card["format"],
    img:       card["image_url"],
    price:     Faker::Number.call(l_digits: 2)
  )
end
Rails.logger.debug "Created #{Card.count} cards"
Rails.logger.debug "Created #{CardClan.count} clans"
Rails.logger.debug "Created #{Province.count} Provinces"
if Rails.env.development?
  AdminUser.create!(email: "admin@example.com", password: "password",
                    password_confirmation: "password")
end
