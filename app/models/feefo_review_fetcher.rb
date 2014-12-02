class FeefoReviewFetcher

  attr_reader :code, :feefo_config

  def initialize(code, feefo_config=load_feefo_config)
    @code = code
    @feefo_config = feefo_config
    @redis = Redis.new
  end

  def fetch_reviews
    with_caching do
      RemoteFeefoReviewFetcher.new(code, feefo_config).fetch_reviews
    end
  end

  private

  def load_feefo_config
    YamlConfiguration.new(Rails.root.join('config/feefo.yml')).data
  end

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

end