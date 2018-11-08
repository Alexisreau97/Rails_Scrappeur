require 'nokogiri'
require 'open-uri'

class StartScrap

  def get_cryptos
    array = []
    webpage = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
    webpage.css('tbody>tr').each do |row|
      hash = {}
      hash['Currency'] = row.css('.currency-name')[0]['data-sort']
      hash['Price'] = row.css('.text-right')[1]['data-sort']
      array << hash
    end
    array
  end

  def perform
    puts get_cryptos
  end

end