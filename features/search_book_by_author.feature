Feature: search for books by author

  As a book lover
  So that I can find books with my favorite author
  I want to include and search on author information in books I enter

Background: books in database

  Given the following books exist:
  | title                 | genre           | author       | publish_date | ISBN_number  |
  | The hunger games      | Drama           | Suzanne Collins |   1986-09-15 | 123-123 |
  | Harry Potter          | Action and Adventure | J. K. Rowling    |   2014-02-11 | 456-456 |
  | To Kill a Mockingbird | Drama           |              |   1958-07-11 |              |
  | The sea of monsters   | Horror          | Rick Riordan |   1979-04-05 | 789-789 |

Scenario: add author to existing book
  When I go to the edit page for "To Kill A Mockingbird"
  And  I fill in "Author" with "Harper Lee"
  And  I press "Update Book Info"
  Then the author of "To Kill A Mockingbird" should be "Harper Lee"

Scenario: find book with same author
  Given I am on the details page for "The hunger games"
  When  I follow "Find Books With Same Author"
  Then  I should be on the Similar Books page for "The hunger games"
  And   I should see "The sea of monsters"
  But   I should not see "Harry Potter"

Scenario: can't find similar books if we don't know author (sad path)
  Given I am on the details page for "To Kill A Mockingbird"
  Then  I should not see "Harper Lee"
  When  I follow "Find Books With Same Author"
  Then  I should be on the home page
  And   I should see "'To Kill A Mockingbird' has no author info"
