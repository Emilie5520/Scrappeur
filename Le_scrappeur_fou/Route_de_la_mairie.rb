require 'rubygems'
require 'nokogiri'
require 'open-uri'

def get_the_email_of_a_townhal_from_its_webpage(url) #récupère email dans la page url= général pour toutes les villes
	page = Nokogiri::HTML(open(url))
	return page.css(".tr-last")[3].text.split[2] #chemin pour avoir seulement l'email
end



def get_all_the_urls_of_val_doise_townhalls 
	doc = Nokogiri::HTML(open('http://annuaire-des-mairies.com/val-d-oise.html'))
	return doc.css(".lientxt").each do |link| # prend les liens un par un pour aller récupérer l'email
	url = "http://annuaire-des-mairies.com" + link["href"][1..-1].to_s
	nom_villes = link.text 
	email_villes = get_the_email_of_a_townhal_from_its_webpage(url) # on fait appel à la première méthode pour récupérer l'email
	nom_mail = {:nom => nom_villes,:email => email_villes}
	puts nom_mail
end
	
end

puts get_all_the_urls_of_val_doise_townhalls
