require 'rubygems'
require 'nokogiri'
require 'open-uri'

def trader_de_lobscur 
	name_crypt = []
	prix_crypt = []
	page = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))
	page.css('.currency-name-container').each { |i| name_crypt << i.text}
	page.css("a.price").each { |x| prix_crypt << x.text}
	puts name_prix_crypt = Hash[name_crypt.zip(prix_crypt)]
end


puts trader_de_lobscur
