require 'spec_helper'


describe "get_ingredient_by_id" do
  before do
    @ingredient = Foodpairing.get_ingredient_by_id(1)
    @name = @ingredient["name"]
  end

  it "returns correct ingredient name" do
    expect(@name).to eql("Bourbon whiskey")
  end
end

describe "get_all_ingredients" do
  before do
    @ingredients = Foodpairing.get_all_ingredients
  end

  it "returns all ingredients" do
    expect(@ingredients).to eql([{"id"=>1, "name"=>"Bourbon whiskey"}, {"id"=>2, "name"=>"Apple"}])
  end
end

describe "search_ingredients_by_name" do
  before do
    @ingredient = Foodpairing.search_ingredients_by_name("cognac")
    @id = @ingredient[0]["id"]
    @name = @ingredient[0]["name"]
  end

  it "returns correct ingredient" do
    expect(@id).to eql(5427)
    expect(@name).to eql("Cognac")
  end
end

describe "get_pairings_for_ingredient" do
  before do
    @pairings = Foodpairing.get_pairings_for_ingredient(1)
  end

  it "returns appropriate pairing" do
    expect(@pairings).to include("Emmental")
  end
end

describe "get_ingredient_nutrients" do
  before do
    @nutrients = Foodpairing.get_ingredient_nutrients(1)
    @id = @nutrients["id"]
  end

  it "returns correct ingredient" do
    expect(@id).to eql(114)
  end
end

describe "get_all_brands" do
  before do
    @brands = Foodpairing.get_all_brands
    @id = @brands[0]["id"]
    @name = @brands[0]["name"]
  end

  it "returns all brands" do
    expect(@id).to eql(1)
    expect(@name).to eql("Remy Cointreau")
  end
end

describe "get_brand_by_id" do
  before do
    @brand = Foodpairing.get_brand_by_id(1)
    @id = @brand["id"]
    @name = @brand["name"]
  end

  it "returns the appropriate brand" do
    expect(@id).to eql(1)
    expect(@name).to eql("Remy Cointreau")
  end
end
