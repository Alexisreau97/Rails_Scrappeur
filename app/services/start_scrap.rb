require 'nokogiri'
require 'open-uri'

class StartScrap

  def initialize
  	@url = "https://coinmarketcap.com/all/views/all/"
  end

  def get_cryptos
    @all_cryptos = []
    webpage = Nokogiri::HTML(open(@url))
    webpage.css('tbody>tr').each do |row|
      hash = {}
      hash['Currency'] = row.css('.currency-name')[0]['data-sort']
      hash['Price'] = row.css('.text-right')[1]['data-sort']
      @all_cryptos << hash
    end
    @all_cryptos
  end

  def save
  	@all_cryptos.each do |i|
  		Crypto.create!(name: i['Currency'], value: i['Price'])
  	end
  end

  def perform
    get_cryptos
    save
  end

end