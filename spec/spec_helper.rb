require 'bundler/setup'
require 'popul'
require 'rspec'
require 'simplecov'
require 'webmock/rspec'

SimpleCov.start do
  add_filter 'spec'
end

RSpec.configure do |config|
  # Enable flags like --only-failures and --next-failure
  config.example_status_persistence_file_path = '.rspec_status'

  config.expect_with :rspec do |c|
    c.syntax = :expect
  end
end

def stub_get(path, endpoint = Popul.endpoint)
  stub_request(:get, endpoint + path)
end
