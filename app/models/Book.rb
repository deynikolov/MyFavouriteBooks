class Book < ApplicationRecord
  before_save :titleize

  def self.all_genres ; %W[#{"Science fiction"} Drama #{"Action and Adventure"} Romance Mystery Horror] ; end
    validates :title, :presence => true
    validates :genre, :inclusion => {:in => Book.all_genres}
    validates :description, :presence => true
    validates :ISBN_number, :presence => true, :unless => :published_after_1967?
    validates :publish_date, :presence => true
    validates :author, :presence => true

  def published_after_1967?
    publish_date && publish_date < Date.parse('1 Jan 1967')
  end

  def titleize
    self.title = title.split.each{|x| x.capitalize!}.join(' ')
  end

  def self.similar_books(book)
    Book.where author: book.author
  end
end
