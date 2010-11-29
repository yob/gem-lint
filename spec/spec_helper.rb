require "rubygems"
require "bundler"
Bundler.setup

require 'rspec'

# Requires supporting ruby files with custom matchers and macros, etc,
# in spec/support/ and its subdirectories.
Dir["spec/support/**/*.rb"].each {|f| require f}

RSpec.configure do |config|
  config.include GemLintSpecHelper
end
