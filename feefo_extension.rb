# Uncomment this if you reference any of your controllers in activate
# require_dependency 'application'

class FeefoExtension < Radiant::Extension
  version "1.0"
  description "Provides feefo review fetching and caching capabilities."
  url "http://www.github.com/sealink/radiant-feefo-extension"
  
  # define_routes do |map|
  #   map.connect 'admin/author/:action', :controller => 'admin/author'
  # end
  
  def activate
  end
  
  def deactivate
  end
  
end