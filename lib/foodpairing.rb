require "httparty"
require "json"
require 'dotenv'
Dotenv.load('variables.env')

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
end
