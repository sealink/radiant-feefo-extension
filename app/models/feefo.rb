module Feefo
  def self.config
    @config ||= Yamload::Loader.new(:feefo, Rails.root.join('config')).loaded_hash
  end

  def self.review_base_url
    name    = URI.encode(config['name'])
    account = URI.encode(config['account'])
    "http://www.feefo.com/reviews/#{name}/?logon=#{account}"
  end
end
