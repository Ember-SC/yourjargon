Feature: add a term
  As a user
  I want to add a term to the dictionary
  So that someone can fill in the definition or someone will benefit from my definition of it.

  Before:
  I am logged into yourjargon

  Scenario Outline: add a term with a definition
    When I enter a term and definition
      | Exists Already? | Desired Outcome                                  |
      | Yes             | Do change term scenario                          |
      | No              | Add term and definition to list of defined terms |

  Scenario Outline: add a term without a definition
    When I enter a term
      | Exists Already? | Desired Outcome                     |
      | Yes             | Do change term scenario             |
      | No              | Add term to list of undefined terms |

  Scenario: add a definition to an existing undefined term
    When I navigate to a term
    Then the system asks for the definition
    When I add the definition
    Then the system adds the definition to the existing term

