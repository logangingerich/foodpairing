require 'bundler/setup'
Bundler.setup

require 'foodpairing'
require "httparty"
require "json"
require 'dotenv'
Dotenv.load('variables.env')

require 'webmock/rspec'
WebMock.disable_net_connect!(:allow_localhost => true)

RSpec.configure do |config|
  config.before(:each) do
    stub_request(:get, "https://api.foodpairing.com/ingredients/1").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "{\"id\":1,\"name\":\"Bourbon whiskey\"}", :headers => {})
    stub_request(:get, "https://api.foodpairing.com/ingredients/").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "[{\"id\":1,\"name\":\"Bourbon whiskey\"},{\"id\":2,\"name\":\"Apple\"}]", :headers => {})
    stub_request(:get, "https://api.foodpairing.com/ingredients?q=cognac").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "[{\"id\":5427,\"name\":\"Cognac\"},{\"id\":2,\"name\":\"Apple\"}]", :headers => {})
    stub_request(:get, "https://api.foodpairing.com/ingredients/1/pairings").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "[{\"_links\": {\"ingredient\": {\"id\": 1739,\"name\":\"Emmental\"}}}]", :headers => {})
    stub_request(:get, "https://api.foodpairing.com/ingredients/1/nutrients").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "{\"id\":114}", :headers => {})
    stub_request(:get, "https://api.foodpairing.com/brands").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "[{\"id\":1,\"name\":\"Remy Cointreau\"},{\"id\":2,\"name\":\"Corman\"}]", :headers => {})
    stub_request(:get, "https://api.foodpairing.com/brands/1").
      with(:headers => {'X-Application-Id'=>ENV['XApplicationID'], 'X-Application-Key'=>ENV['XApplicationKey']}).
        to_return(:status => 200, :body => "{\"id\":1,\"name\":\"Remy Cointreau\"}", :headers => {})
  end
end
