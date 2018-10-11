require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_all_the_urls_of_val_doise_townhalls
	page = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	page = page.css(".lientxt").each do |var|
	puts "http://annuaire-des-mairies.com" + var['href'][1..-1]
	end
end

puts get_all_the_urls_of_val_doise_townhalls


