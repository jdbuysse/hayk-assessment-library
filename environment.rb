# Create classes for `Book`, `BookAuthor`, and `Author`. You should be able to:

# * Create a book
# * Create an author
# * Add a book to an author
# * Add an author to a book
# * Get a list of an author's books
# * Get a list of a book's authors

# Books and Authors shouldn't be stored in each other's classes (use a single source of truth).
require 'pry'



class Author
    attr_accessor :name, :books
    @@all = []
    def initialize name
        @name = name
        @books = []
        @@all << self
    end

    def add_book book
        @books << book
    end

    def list_books
        @books
    end

    def self.all
        @@all
    end
end


class Book
    attr_accessor :title

    def initialize title
        @title = title
    end

    def add_author author
        Author.add_book(self)
    end

    def list_authors
        Author.all.select do |author|
            author.books.include?(self)
        end 
    end

    
end



a = Author.new("Anne")
b = Author.new("Brad")
c = Author.new("Cate")

aa = Book.new("Anne and Brad's math textbook")
bb = Book.new("Brad's cookbook")
cc = Book.new("book c")

binding.pry