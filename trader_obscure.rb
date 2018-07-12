require 'nokogiri'
require 'open-uri'

def trader_obscure
  doc = Nokogiri::HTML(open('https://coinmarketcap.com/all/views/all/'))

  names = doc.css('a.currency-name-container.link-secondary').map{ |name| name.text } #Les noms
  prices = doc.css('a.price').map{ |price| price.text } #Les prix
  
  res=[]
  names.length.times do |i|
    res += [{ 'name' => names[i], 'price' => prices[i] }]
    i += 1
  end
  return res
end

def refresh_each_hour
  t = Time.now #Temps qui va rester figé
  while 0
    t1 = Time.now #Temps qui s'actualise
    if t1.min == t.min && t1.sec == t.sec #Si les minutes et secondes sont égales
      p trader_obscure                    #alors on est rendu à l'heure d'après
    end
  end
end

refresh_each_hour