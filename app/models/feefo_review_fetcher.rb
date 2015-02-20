class FeefoReviewFetcher

  attr_reader :code, :feefo_config

  def initialize(code, feefo_config = Feefo.config)
    @code = code
    @feefo_config = feefo_config
    @redis = Redis.new(host: redis_config['host'],
                       port: redis_config['port'],
                       db: redis_config['db'])
  end

  def fetch_reviews_json
    with_caching do
      RemoteFeefoReviewFetcher.new(code, feefo_config).fetch_reviews
    end
  end

  private

  def with_caching
    fetch_from_cache.presence || yield.tap { |reviews| store_in_cache(reviews) }
  end

  def fetch_from_cache
    @redis.get feefo_key(code)
  end

  def store_in_cache(reviews)
    @redis.setex feefo_key(code), feefo_config['time_to_cache_reviews'], reviews
  end

  def feefo_key(code)
    "feefo_reviews_for_#{code}"
  end

  def redis_config
    @redis_config ||= Yamload::Loader.new(:redis, Rails.root.join('config')).loaded_hash[Rails.env]
  end

end
