class FeefoReviews
  attr_reader :reviews, :summary

  def initialize(code)
    data = fetch_reviews_json(code)
    return unless data

    @reviews = Array.wrap(data['FEEDBACKLIST']['FEEDBACK'])
    @summary = data['FEEDBACKLIST']['SUMMARY']
  end

  def average
    @summary['AVERAGE']
  end

  def count
    @summary['COUNT']
  end

  private
 
  def fetch_reviews_json(feefo_code)
    fetcher = FeefoReviewFetcher.new(feefo_code)
    JSON.parse(fetcher.fetch_reviews_json)
  rescue JSON::ParserError => e
    nil
  end
end