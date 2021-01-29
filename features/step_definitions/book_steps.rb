Given(/^the following books exist:$/) do |books_table|
  books_table.hashes.each do |book|
    Book.create book
  end
end

Then /(.*) seed books should exist/ do | n_seeds |
  expect(Book.count).to eq(n_seeds.to_i)
end

When /I (un)?check the following genres: (.*)/ do |uncheck, genre_list|
  genre_list.split(',').each do |genre|
    field = "genres_#{genre.strip}"
    if uncheck
      uncheck field
    else
      check field
    end
  end
end

Then /I should see all the books/ do
  rows = page.all('#books tr').size - 1
  expect(rows).to eq(Book.count())
end

Then(/^the author of "([^"]*)" should be "([^"]*)"$/) do |arg1, arg2|
  Book.find_by_title(arg1).author == arg2
end
