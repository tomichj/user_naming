$LOAD_PATH.unshift(File.dirname(__FILE__))
ENV['RAILS_ENV'] ||= 'test'

require 'user_naming'
require 'rspec'
require 'active_support'
require 'factory_girl'

# Load factory girl factories.
Dir[File.join(File.dirname(__FILE__), 'factories/**/*.rb')].each { |f| require f }

RSpec.configure do |config|
  config.include FactoryGirl::Syntax::Methods
  config.order = :random
end
