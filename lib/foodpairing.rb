require "httparty"
require "json"

class Foodpairing
  def self.test
    response = HTTParty.get("https://api.foodpairing.com/ingredients/1", headers: { 'X-Application-ID' => "a5934b11", 'X-Application-Key' => "8c253b200c5589734c4f833ee61b31fb" })
    JSON.parse(response.body)
  end
end
