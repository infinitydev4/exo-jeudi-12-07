
require 'rubygems'
require 'nokogiri'
require 'open-uri'

 
def get_the_email_of_a_townhal_from_its_webpage(page_url)
    page = Nokogiri::HTML(open(page_url))
 
	return   page.css('td')[7].text
     
end

def get_all_the_urls_of_val_doise_townhalls()

page = Nokogiri::HTML(open("http://www.annuaire-des-mairies.com/val-d-oise.html"))
ville = page.css('p>a').map {|ville| ville.text

}
 link = page.css('p>a').map {|vill| vill['href']} 
return [ville,link]

end




def annuaire_mail_ville
	hash = []
	i=0
	
array = get_all_the_urls_of_val_doise_townhalls
	villes=array[0]
	@email = array[1].map{ |url|
	get_the_email_of_a_townhal_from_its_webpage("http://www.annuaire-des-mairies.com/#{url}")}
	villes.length.times do
		hash += [{ "name" => villes[i], "email" => @email[i]}] 
		i += 1
	end
	p hash
	end
	annuaire_mail_ville()
