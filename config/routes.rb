ActionController::Routing::Routes.draw do |map|

  map.feefo_fetch_reviews '/feefo/fetch_reviews/:product_code',
                          controller: :feefo, 
                          action:     'fetch_reviews',
                          conditions: {method: :get}

end
