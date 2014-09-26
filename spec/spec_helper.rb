if ENV['COVERAGE']
  require 'simplecov'
  require 'simplecov-rcov'
  SimpleCov.formatter = SimpleCov::Formatter::RcovFormatter
  SimpleCov.start
end

require 'audience_manager'
require 'vcr'
require 'dotenv'

Dotenv.load

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end

AudienceManager.configure do |config|
  config.client_id     = ENV['AAM_CLIENT_ID']
  config.client_secret = ENV['AAM_CLIENT_SECRET']
  config.user          = ENV['AAM_USER']
  config.password      = ENV['AAM_PASSWORD']
end

RSpec.configure do |config|
  config.expect_with :rspec do |expectations|
    expectations.include_chain_clauses_in_custom_matcher_descriptions = true
  end

  config.mock_with :rspec do |mocks|
    mocks.verify_partial_doubles = true
  end
end
