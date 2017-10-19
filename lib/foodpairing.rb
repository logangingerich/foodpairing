require "httparty"
require "json"
#require 'dotenv'
#Dotenv.load('variables.env')

class Foodpairing

  def self.get_ingredient_by_id(id)
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @ingredient = JSON.parse(response.body)
  end

  def self.get_all_ingredients
    response = HTTParty.get("https://api.foodpairing.com/ingredients/", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @ingredients = JSON.parse(response.body)
  end

  def self.search_ingredients_by_name(name)
    response = HTTParty.get("https://api.foodpairing.com/ingredients?q=#{name}", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @ingredients = JSON.parse(response.body)
  end

  def self.get_pairings_for_ingredient(id)
    @pairings_array = []
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}/pairings", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @pairings_object = JSON.parse(response.body)
    @pairings_object.each do |pairing|
      @pairings_array.push(pairing["_links"]["ingredient"]["name"])
    end
    @pairings_array
  end

  def self.get_ingredient_nutrients(id)
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}/nutrients", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @nutrients = JSON.parse(response.body)
  end

  def self.get_all_brands
    response = HTTParty.get("https://api.foodpairing.com/brands", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @brands = JSON.parse(response.body)
  end

  def self.get_brand_by_id(id)
    response = HTTParty.get("https://api.foodpairing.com/brands/#{id}", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @brand = JSON.parse(response.body)
  end
end
