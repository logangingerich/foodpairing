require 'spec_helper'

# Types of testing, integration, end to end and ui, unit

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

  it "does not return nil" do
    expect(@ingredients).not_to be_nil
  end
end

describe "search_ingredients_by_name" do
  before do
    @ingredient = Foodpairing.search_ingredients_by_name("cognac")
    @id = @ingredient[0]["id"]
    p @id
  end

  it "finds correct ingredient" do
    expect(@id).to eql(5427)
  end
end
