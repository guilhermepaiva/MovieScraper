require 'nokogiri'
require 'open-uri'

# https://www.rottentomatoes.com/m/ghostbusters_2016/ doc.at("//h1[@data-type = 'title']").text get the title
# doc.at("//span[@class = 'meter-value superPageFontColor']").text gets the rate
# doc.at_css('#movie-image-section img')['src'] get the image 
# doc.at("//div[@class = 'col col-sm-19 col-xs-14 text-left']").text for rating
#doc.at("//div[@class = 'col-sm-19 col-xs-14 text-left']").text for director

