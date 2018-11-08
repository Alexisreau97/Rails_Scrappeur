
require 'nokogiri'
require 'open-uri'

class StartScrap


	def initialize
	  @array = []
	  webpage = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))
		  webpage.css('tbody>tr').each do |row|
		    hash = {}
		    hash['Currency'] = row.css('.currency-name')[0]['data-sort']
		    hash['Price'] = row.css('.text-right')[1]['data-sort']
		    @array << hash
		  end
	  @array
	end





	def save
	  @array.each do |currency|
         Cryptodb.create(name: currency["Currency"], price: currency["Price"])
       end
	end

	def perform
		if Cryptodb.first != nil
				Cryptodb.destroy_all
		end
		initialize
		save
	end

end
