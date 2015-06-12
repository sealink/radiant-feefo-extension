$LOAD_PATH.unshift File.expand_path('../../app/models', __FILE__)

require 'vcr'
require 'redis'
require 'active_support'
require 'support/coverage_loader'

require 'feefo'
require 'feefo_review_fetcher'
require 'feefo_reviews'
require 'remote_feefo_review_fetcher'

VCR.configure do |c|
  c.cassette_library_dir = 'spec/cassettes'
  c.hook_into :webmock
end
