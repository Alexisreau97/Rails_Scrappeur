require 'nokogiri'
require 'open-uri'
class StartScrap

  def initialize
    @url = "https://coinmarketcap.com/all/views/all/"
  end

  def get_cryptos
    @all_crypto = []
    webpage = Nokogiri::HTML(open(@url))
    webpage.css('tbody>tr').each do |row|
      hash = {}
      hash['Currency'] = row.css('.currency-name')[0]['data-sort']
      hash['Price'] = row.css('.text-right')[1]['data-sort']
      @all_crypto << hash
    end
    @all_crypto
  end

  def save
    @all_crypto.each do |a|
       Crypto.create!(name: a["Currency"], value: a["Price"])
      end
  end

  def perform
    get_cryptos
    save
  end
end
