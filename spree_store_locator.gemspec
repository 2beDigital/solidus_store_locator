# encoding: UTF-8
Gem::Specification.new do |s|
  s.platform    = Gem::Platform::RUBY
  s.name        = 'solidus_store_locator'
  s.version     = '1.2.1'
  s.summary     = 'A Store Locator for your Solidus Store'
  s.description = 'Show your customer where do you sell easily'
  s.required_ruby_version = '>= 2.0.0'

  s.author    = 'Matteo Alessani'
  s.email     = 'alessani@gmail.com'

  #s.files       = `git ls-files`.split("\n")
  #s.test_files  = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.require_path = 'lib'
  s.requirements << 'none'

  s.add_dependency 'solidus_core', '~> 2.1.0'
  s.add_dependency 'solidus_backend', '~>2.1.0'
  s.add_dependency 'solidus_frontend', '~> 2.1.0'
  s.add_dependency 'geocoder', '1.2.6'
  s.add_dependency 'jbuilder', '~> 2.3'

  s.add_development_dependency 'capybara', '~> 2.4'
  s.add_development_dependency 'coffee-rails'
  s.add_development_dependency 'database_cleaner'
  s.add_development_dependency 'factory_girl', '~> 4.5'
  s.add_development_dependency 'ffaker'
  s.add_development_dependency 'rspec-rails',  '~> 3.1'
  s.add_development_dependency 'sass-rails', '~> 5.0.0.beta1'
  s.add_development_dependency 'selenium-webdriver'
  s.add_development_dependency 'simplecov'
  s.add_development_dependency 'sqlite3'
end
