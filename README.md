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

This can be done a number of ways, but we recomment using [Figaro](https://github.com/laserlemon/figaro) for ease of use. It is important that you set the variables using the following syntax, so that the Foodpairing gem can access them:

```ruby
XApplicationID = your-key-here
XApplicationKey= your-id-here
```
As long as the Environment variables are accessible as `ENV['XApplicationID']` and `ENV['XApplicationKey']` respectively, you should be all set.
