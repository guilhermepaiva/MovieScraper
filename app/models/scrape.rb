class Scrape
	attr_accessor :title, :hotness, :image_url, :rating, :director, :genre, :runtime, :synopsis, :failure

	def scrape_new_movie
		begin
			doc = Nokogiri::HTML(open("https://www.rottentomatoes.com/m/ghostbusters_2016/"))
			doc.css('script').remove
			self.title = doc.at("//h1[@data-type = 'title']").text
			self.hotness = doc.at("//span[@class = 'meter-value superPageFontColor']").text.to_i
			self.image_url = doc.at_css('#movie-image-section img')['src']
			self.rating = doc.at("//div[@class = 'col col-sm-19 col-xs-14 text-left']").text
			self.director = doc.at("//div[@class = 'col-sm-19 col-xs-14 text-left']").text
			return true
		rescue Exception => e
			self.failure = "Something went wrong with the scrape"
		end
	end

	def save_movie
		movie = Movie.new(
			title: self.title,
			hotness: self.hotness,
			image_url: self.image_url,
			rating: self.rating,
			director: self.director)
		movie.save
	end
end