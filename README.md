# Foodpairing Ruby Gem

The Foodpairing Ruby gem is a simply Ruby wrapper for the Foodpairing API. For more information on the API itself, visit the [Foodpairing Site](http://developer.foodpairing.com/) and their [Apiary site for documetation](http://docs.foodpairingpublicapi.apiary.io/).

To get started, add the gem to your Gemfile:

```ruby
gem 'foodpairing'
```

And then execute:

```ruby
$ bundle
```

Or, you can install it yourself with:

```ruby
$ gem install foodpairing
```

### Next, you will need to set your personal API KEY and ID as Environment Variables:

First, you will need the [Foodpairing API Site](http://developer.foodpairing.com/) and submit a request for a API Key and ID. It should only take a day or two to hear back with your personal key and id.

Setting your variables can be done a number of ways, but we recommend using [Figaro](https://github.com/laserlemon/figaro) for ease of use. It is important that you set the variables using the following syntax, so that the Foodpairing gem can access them:

```ruby
XApplicationID: your-key-here
XApplicationKey: your-id-here
```
Depending on what you use to set your environment variables (Figaro, Dotenv, etc.) the syntax might be slightly different. But, as long as the environment variables are accessible as `ENV['XApplicationID']` and `ENV['XApplicationKey']` respectively, you should be all set.

## Usage

Usage for the Foodpairing app is simple and straightforward. You simply access Foodpairing data by calling the `Foodpairing` class with one of the built in mehods. Here is a list of methods that you can access, with an example of what they will return. *(Note: In return examples, some object info is taken out for brevity.)*

**Get Ingredient By ID** (Require Ingredient ID as a parameter)

Returns a single object with information for corresponding ingredient:
```ruby
> Foodpairing.get_ingredient_by_id(1)
 => {"id"=>1, "name"=>"Bourbon whiskey", "product"=>"Bourbon whiskey", "preparation"=>"", "_links"=>{"preparation"=>nil, "image"=>{"id"=>481,}, "origin"=>{"id"=>3877, "name"=>"America", "iso_code"=>nil, "type"=>"", "parent"=>0}, "brand"=>nil, "categories"=>[{"id"=>38, "href"=>"https://api.foodpairing.com/taxonomies/ingredients/categories/38"}, {"id"=>86, "href"=>"https://api.foodpairing.com/taxonomies/ingredients/categories/86"}]}, "description"=>"A type of distilled spirit, made primarily from corn and named for Bourbon County, Kentucky.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "is_ghost"=>false}}
```

**Get All Ingredients**

Returns an array containing objects of all ingredients:
```ruby
> Foodpairing.get_all_ingredients
 => [{"id"=>5902, "name"=>"1724 Tonic", "product"=>"1724 Tonic", description"=>"The essence of 1724 Tonic Water has its origins in the Andes, on the mythical Inca Trail. This is not by chance. This is where quinine was discovered. There, this ingredient gains the authenticity of a product with roots in the region that go back hundreds of years. At 1724 metres above sea level. Not a metre above or below.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "index"=>0, "is_ghost"=>false}},

{"id"=>5440, "name"=>"A la Chimay Bleue", "product"=>"A la Chimay Bleue", "preparation"=>"", "description"=>"The rind of the à la Chimay Bleue is regularly washed with the Chimay Blue Cap during his stay in the aging cellars of the monestarey. Pronounced flavor with a slight bitterness of the hops.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "index"=>1, "is_ghost"=>false}},

{"id"=>5443, "name"=>"A la Chimay Rouge", "product"=>"A la Chimay Rouge", "preparation"=>"", "description"=>"The à la Chimay Rouge is a round, smooth cheese with creamy texture. Its natural rind is washed with Chimay Red Cap. Fruity flavour with slight bitterness.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "index"=>2, "is_ghost"=>false}},

{"id"=>4758, "name"=>"Acacia honey (fresh)", "product"=>"Acacia honey", "preparation"=>"fresh"]
```

**Search Ingredients By Name** (Takes string parameter of ingredient name)

Returns an array containing objects of all ingredients that match name:
```ruby
> Foodpairing.search_ingredients_by_name("cheese")
=> [{"id"=>1852, "name"=>"Cottage cheese", "product"=>"Cottage cheese", "preparation"=>"", "description"=>"Cottage cheese is a cheese curd product with a mild flavor. It is drained, but not pressed, so some whey remains and the individual curds remain loose.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "index"=>0, "exact_match"=>false, "is_ghost"=>false}},

{"id"=>4697, "name"=>"Goat Cheese (fresh)", "product"=>"Goat Cheese", "preparation"=>"fresh", "description"=>"Goat cheese, or chèvre (from the French for goat), is cheese made out of the milk of goats. Although cow's milk and goat's milk have similar overall fat contents, the higher proportion of medium-chain fatty acids in goat's milk contributes to the characteristic flavor of goat's milk cheese.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "index"=>1, "exact_match"=>false, "is_ghost"=>false}},

{"id"=>4582, "name"=>"Cream cheese (fresh)", "product"=>"Cream cheese", "preparation"=>"fresh", "description"=>"Cream cheese is a soft, mild-tasting cheese with a high fat content. Traditionally, it is made from unskimmed milk enriched with additional cream.", "_meta"=>{"created_at"=>"", "modified_at"=>"", "index"=>2, "exact_match"=>false, "is_ghost"=>false}},

{"id"=>5565, "name"=>"Damse Mokke cheese", "product"=>"Damse Mokke cheese", "preparation"=>"", "description"=>"The Damse Cheese Dairy is a traditional producer of organic cheese. The cheese dairy was created in 1989 on an ancient farm in Damme in the polders surrounding Bruges. To valorize excess milk the farmer started with the production of cheese. In 1992 the cheese dairy moved to a new location in Sijsele.", {"created_at"=>"", "modified_at"=>"", "index"=>3, "exact_match"=>false, "is_ghost"=>false}}]
```

**Get Pairings For Ingredient** (Takes an ingredient ID as a parameter)

Returns an array containing string names of all pairings for the ingredient:
```ruby
> Foodpairing.get_pairings_for_ingredient(1)
 => ["Emmental", "Pineapple (fresh)", "Black tea", "Elderflower", "Apricot (fresh)", "Passoã®", "Apple juice", "Apple (fresh)", "Gueuze Fond Tradition", "Parmigiano Reggiano", "Gruyère", "Olive oil 'Family Reserve' Arbequina", "Cointreau®", "Zacapa 23 Solera", "French fries", "Angostura bitters®", "Banana (fresh)", "Mango (fresh)", "Soy miso", "Sencha tea", "Gorgonzola", "Bayonne ham (dry-cured)", "Edible crab (cooked)", "Crab meat", "Dab (baked)"]
```
**Get All Brands**

Returns an array containing objects of all brands in the API:
```ruby
> Foodpairing.get_all_brands
=> [{"id"=>219, "name"=>"Flying Dog Brewery", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}},
{"id"=>220, "name"=>"Budweiser", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}},
{"id"=>221, "name"=>"Eviltwin Brewing", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}}, {"id"=>222, "name"=>"Cerveceria Modelo", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}},
{"id"=>223, "name"=>"Clown Shoes Beer", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}},
{"id"=>224, "name"=>"Firestone Walker", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}},
{"id"=>225, "name"=>"Widmer Brothers Brewing Company", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}}]
```

**Get Brand By ID** (Takes a brand ID as a parameter)

Returns an object with data for corresponding brand:
```ruby
> Foodpairing.get_brand_by_id(1)
=> {"id"=>1, "name"=>"Remy Cointreau", "website"=>"", "description"=>"", "_links"=>{"images"=>[]}}
```

## Contributing
I welcome any and all contributions to improve the quality of the Foodpairing Gem. To get started, go through the following steps:

1. Fork and Clone the project.
2. Uncomment out lines 3 and 4 of lib/foodpairing.rb to access Dotenv.
3. Create a file in the root directory called `variables.env'
4. With your personal API key and id from [Foodpairing](http://developer.foodpairing.com/), add to variables.env with the following:
```ruby
export XApplicationID=your-id-here
export XApplicationKey=your-key-here
```
5. After your changes are made, run RSpec tests to make sure that everything sill passes. If necessary, write new tests for your contribution.
6. Submit a detailed pull request

I will respond to all requests as soon as possible. Thank you!
