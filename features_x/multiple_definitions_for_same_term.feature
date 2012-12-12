Feature: Multiple definitions for same term
  As a subscriber
  I want to be able to define multiple definitions for the same term
  because sometimes the organization has multiple meanings for the same term

  Scenario: Display multiple definitions for a term
    Given that I'm logged into an organization
    When I go to the term 'frame'
    Then I see an ordered list of definitions
    |||
      1. the shape of an iframe in html
      2. the frame holding the work table up
      3. a reference to a perspective
    |||

  Scenario: Enter an additional definition for a term
    Given that I'm logged into an organization
    And I am at a term 'second' with a definition 'unit of time'
    When I add the definition 'item 2 in a list'
    Then I see an ordered list of definitions
    |||
      1. unit of time
      2. item 2 in a list
    |||

  Scenario: Remove one of multiple definitions for a term
    Given that I'm logged into an organization
    And I am at a term 'second' with definitions
    |||
      1. unit of time
      2. item 2 in a list
    |||
    When I select 1)
    And I do the delete command
    Then I should see
    |||
      1. item 2 in a list
    |||

