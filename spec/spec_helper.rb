$LOAD_PATH.unshift File.expand_path('../../app/models', __FILE__)

require 'vcr'
require 'redis'
require 'active_support'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
