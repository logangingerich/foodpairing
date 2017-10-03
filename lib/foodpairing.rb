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
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}/pairings", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    @pairings = JSON.parse(response.body)
  end

  def self.get_ingredient_nutrients(id)
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}/nutrients", headers: { 'X-Application-ID' => ENV['XApplicationID'], 'X-Application-Key' => ENV['XApplicationKey'] })
    nutrients = JSON.parse(response.body)
    #nutrients.each do |nutrient|
      #p nutrient["_links"]["nutrient"]["href"]
    #end
    #second_response = HTTParty.get("#{nutrients["_links"]["nutrient"]["href"]}", headers: { 'X-Application-ID' => 'a5934b11', 'X-Application-Key' => '8c253b200c5589734c4f833ee61b31fb' })
    #p second_response.body
    #nutrients2 = JSON.parse(second_response.body)
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
