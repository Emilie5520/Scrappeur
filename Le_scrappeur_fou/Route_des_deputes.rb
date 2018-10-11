require 'rubygems'
require 'nokogiri'
require 'open-uri'



def get_email(url)
 	page = Nokogiri::HTML(open(url))
 	nodes = page.xpath "//a[starts-with(@href, \"mailto:\")]/@href"
 	email = nodes.collect {|n| n.value[7..-1]}   	#fait commencer apres mailto:
	email.uniq
end

def get_urls
 	page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
 	page = page.css('ul.col3/li/a').each do |var|
	"http://www2.assemblee-nationale.fr/" + var['href'][1..-1] 
	end
end

def get_emails_desputes
	page = Nokogiri::HTML(open('http://www2.assemblee-nationale.fr/deputes/liste/alphabetique'))
 	page = page.css('ul.col3/li/a').each do |var|
	url = "http://www2.assemblee-nationale.fr/" + var['href'][1..-1].to_s
	desputes_name = var.text
	desputes_email = get_email(url)
	mail = desputes_name.to_s + " " + desputes_email.to_s
	p mail
end
end
	puts get_emails_desputes

	#{:nom => desputes_name, :email => desputes_email} pour l'avoir dans un hash






