require "httparty"
require "json"
require 'dotenv'
Dotenv.load('variables.env')

class Foodpairing
  def self.get_ingredient_by_id(id)
    #response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    #@ingredient = JSON.parse(response.body)
    p 'foofjdskfjdskl'
  end

  def self.get_all_ingredients
    p "YOYOYOYO@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@@"
    response = HTTParty.get("https://api.foodpairing.com/ingredients/", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    p response
    @ingredients = JSON.parse(response.body)
  end

  def self.search_ingredients_by_name(name)
    response = HTTParty.get("https://api.foodpairing.com/ingredients?q=#{name}", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @ingredients = JSON.parse(response.body)
  end

  def self.get_pairings_for_ingredient(id)
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}/pairings", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @pairings = JSON.parse(response.body)
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
