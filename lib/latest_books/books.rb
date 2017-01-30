class LatestBooks::Books
  attr_accessor :name, :author_name, :price, :url
  def self.today
   self.scrape_barnesandnoble
  end

  def self.scrape_barnesandnoble
    doc = Nokogiri::HTML(open("http://www.barnesandnoble.com/b/new-releases/_/N-1oyg"))
      books = []
      doc.search("div.resultsListContainer li.clearer ul li").each do |b|
        book = self.new
        book.name = b.search("div.product-info p.product-info-title").text.strip
        book.author_name = b.search("div.product-info span.contributors a").text.strip
        book.price = b.search("ul.formats li span.price a").text.strip
        book.url = b.search("div.product-info p.product-info-title a").map { |link| link.attribute('href').value}
      books << book
  end
    books.delete_if {|i| i.name == ""}
end
end
