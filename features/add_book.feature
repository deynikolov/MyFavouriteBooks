Feature: User can manually add book

Scenario: Add a book
 Given I am on the MyFavouriteBooks home page
 When I follow "Add new book"
 Then I should be on the Create New Book page
 When I fill in "Title" with "Hobbit"
 And I fill in "ISBN Number" with "122-322"
 And I select "Action and Adventure" from "Genre"
 And I press "Save Changes"
 Then I should be on the MyFavouriteBooks home page
 And I should see "Hobbit"
