
class LatestBooks::CLI
  def call
    puts "                      *******************************"
    puts "                      * Welcome TO Latest Books !!! *"
    puts "                      *******************************"
    list_books
    menu
    puts "************************************************************************"
    see_you
  end
  def list_books
    puts "New Released Books:"
    puts "^^^^^^^^^^^^^^^^^^^^"
   @books= LatestBooks::Books.today
   @books.each.with_index(1) do |book, i|
     puts "#{i}- #{book.name} - #{book.author_name} - #{book.price}"
     puts "________________________________________________________________________"
     #puts "http://www.barnesandnoble.com/#{@books[0].url.join(" ")}"
   end
  end
  def menu
    input=nil
    while input != "exit"
      puts "Enter the number of the book you wanted to know more about or type list to see new released books again or type exit to inter:"
      puts "_________________________________________________________________________"
      input = gets.strip.downcase

      #if input.to_i > 0
    #  the_book = @books[input.to_i-1]
         #puts "#{the_book.name} - #{the_book.author_name} - #{the_book.price}--#{the_book.url} "
      if input=="list"
        list_books
      elsif  input.to_i > 0
      # system(open("http://www.barnesandnoble.com/#{@books[input.to_i-1].url.join(" ")}"))
      # Launchy.open("http://www.barnesandnoble.com/#{@books[input.to_i-1].url[0]}")
        link = "http://www.barnesandnoble.com/#{@books[input.to_i-1].url[0]}"
        if RbConfig::CONFIG['host_os'] =~ /mswin|mingw|cygwin/
          system "start #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /darwin/
          system "open #{link}"
        elsif RbConfig::CONFIG['host_os'] =~ /linux|bsd/
          system "xdg-open #{link}"
        end
      else
        puts "wrong choice,enter list or a number or exit."
      end
    end
  end
  
  def see_you
    puts "Thank you for using our application. See you next time!"
    puts "***     *** "
    puts "*    *    *"
    puts " * BYE!! *"
    puts "  *    *"
    puts "     *"
  end
end
