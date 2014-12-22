require 'net/http'

class FeefoController < SiteController

  def fetch_reviews
    code = params[:product_code]
    reviews = FeefoReviewFetcher.new(code).fetch_reviews
    render json: reviews, status: 200
  end
end
