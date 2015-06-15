module Feefo
  def self.config
    @config
  end

  def self.config=(config)
    @config = config.symbolize_keys
  end

  def self.review_base_url
    name    = URI.encode(config.fetch(:name))
    account = URI.encode(config.fetch(:account))
    "http://www.feefo.com/reviews/#{name}/?logon=#{account}"
  end
end
