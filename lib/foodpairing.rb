require "httparty"
require "json"

class Foodpairing
  def self.get_ingredient_by_id(id)
    response = HTTParty.get("https://api.foodpairing.com/ingredients/#{id}", headers: { 'X-Application-ID' => 'a5934b11', 'X-Application-Key' => "8c253b200c5589734c4f833ee61b31fb" })
    p ENV['X-Application-ID']
    @ingredient = JSON.parse(response.body)
  end

  def self.get_all_ingredients
    response = HTTParty.get("https://api.foodpairing.com/ingredients/", headers: { 'X-Application-ID' => "a5934b11", 'X-Application-Key' => "8c253b200c5589734c4f833ee61b31fb" })
    @ingredients = JSON.parse(response.body)
  end

  def self.search_ingredients_by_name(name)
    response = HTTParty.get("https://api.foodpairing.com/ingredients?q=#{name}", headers: { 'X-Application-ID' => "a5934b11", 'X-Application-Key' => "8c253b200c5589734c4f833ee61b31fb" })
    @ingredients = JSON.parse(response.body)
  end
end
