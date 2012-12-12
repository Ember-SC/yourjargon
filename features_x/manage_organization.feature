Feature: Manage organization
  
  Scenario: User creates an organization

  Scenario: Administrator invites person to join organization
    Given that I am logged into an organization
    And I have thee admin role
    When I invite a person to join by specifying his email address
    Then that person will receive an invitation email
    And the email will contain a link to click in order to subscribe

  Scenario: Invitee joins organization
    Given that I am not subscribed to an organization
    When I receive an email inviting me to join that organization
    And I click the subscribe link
    Then I will visit a page where I can enter my subscription information
    When I enter my subscription information
    Then the organization will add me as a member
    And I will go to the login page