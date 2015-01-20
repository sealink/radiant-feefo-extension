class Feefo
  def config
    @config ||= YamlConfiguration.new(Rails.root.join('config/feefo.yml')).data
  end

  def review_base_url
    name    = URI.encode(config['name'])
    account = URI.encode(config['account'])
    "http://www.feefo.com/reviews/#{name}/?logon=#{account}"
  end
end
