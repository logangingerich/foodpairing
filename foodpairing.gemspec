Gem::Specification.new do |s|
  s.name          = 'foodpairing'
  s.version       = '0.0.1'
  s.date          = '2017-09-11'
  s.summary       = 'Foodpairing API Wrapper'
  s.description   = 'A rubygem wrapper for the Foodpairing API'
  s.authors       = ['Logan Gingerich']
  s.email         = 'loganpgingerich@gmail.com'
  s.files         = ['lib/foodpairing.rb']
  s.require_paths = ["lib"]
  s.homepage      =
    'http://rubygems.org/gems/foodpairing'
  s.license       = 'MIT'
  s.add_runtime_dependency 'httparty', '~> 0.13'
  s.add_runtime_dependency 'json', '~> 1.8'
  s.add_development_dependency "rspec", '~> 3.4'
  s.add_development_dependency 'dotenv', '~> 2.1', '>= 2.1.1'
end
