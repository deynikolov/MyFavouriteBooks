class Book < ApplicationRecord
  def
    self.all_genres ; %w['Science fiction','Drama','Action and Adventure','Romance','Mystery','Horror'] ;
    validates :title, :presence => true
    validates :genre, :inclusion => {:in => Book.all_genres}
    validates :description, :presence => true
    validates :published_1967_or_later
    validates :ISBN_number, :unless => :published_after_1967?
    validates :publish_date, :presence => true
  end

  def published_1967_or_later
    errors.add(:publish_date, 'must be 1967 or later') if
      publish_date && publish_date < Date.parse('1 Jan 1967')
  end

  @@published_date = Date.parse('1 Jan 1967')
  def published_after_1967?
    released_date && released_date < @@published_date
  end
end
