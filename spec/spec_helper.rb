ENV["RACK_ENV"] = 'test'

require_relative '../lib/speedio'
require 'vcr'

VCR.configure do |c|
  c.cassette_library_dir = File.join(__dir__, "fixtures/vcr_cassettes")
  c.hook_into :webmock
  c.ignore_hosts '127.0.0.1'
  c.filter_sensitive_data("<FILTERED>") { ENV['SPEEDIO_TOKEN'] }
end

RSpec.configure do |config|
  config.color = true
  config.tty   = true
  config.order = "random"
end

Speedio.configure do |config|
  config.token = ENV["SPEEDIO_TOKEN"]
end
