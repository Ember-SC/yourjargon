Feature: add a term
  As a user
  I want to add a term to the organization
  So that someone can fill in the definition or someone will benefit from my definition of it.

  Background:
    Given I am logged into yourjargon
    And I am in an organization

  Scenario: add a term with a definition
    When I enter a term and definition
    Then the term and definition is added to the organization's terms list

  Scenario: add a term without a definition
    When I enter a term
    Then the term only is added to the organization's terms list

  Scenario: add a definition to an existing undefined term
    When I navigate to a term entry in the organization's list of terms
    And I add the definition
    Then the term and its definition is updated in the organization's list of terms

