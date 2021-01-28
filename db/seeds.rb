books = [
  {:title => 'Eragon', :genre => 'Action and Adventure', :description => 'Book about a young man...', :ISBN_number => '222-333', :publish_date => '12-Jun-1995'},
  {:title => 'Drakula', :genre => 'Horror', :description => 'Story about a vampite who...', :ISBN_number => '444-333', :publish_date => '1-Aug-1985'},
  {:title => 'World of warcraft', :genre => 'Science fiction', :description => 'The book tell the story of the...', :ISBN_number => '555-777', :publish_date => '12-Jan-2001'},
  {:title => 'Call of the wild', :genre => 'Drama', :description => 'A young man...', :ISBN_number => '288-999', :publish_date => '11-Jun-1973'},
  {:title => 'Lord of the rings', :genre => 'Action and Adventure', :description => 'The story of the young mythical world...', :ISBN_number => '111-333', :publish_date => '10-Jun-1989'},
]

books.each do |book|
  Book.create!(book)
end

# t.string :title
# t.string :genre
# t.text :description
# t.string :ISBN_number
# t.datetime :publish_date
