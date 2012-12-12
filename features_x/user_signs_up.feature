Feature: user signs up
  In order to track content changes by author
  As a new user
  I want to create a protected account for this application so that other authors cannot attribute content changes to me.

  Scenario: user signs up
    Given that I am not a registered user
    When I submit my user id, email, password
    Then I am a registered user