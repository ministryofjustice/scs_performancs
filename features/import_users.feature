Feature: Import users
  Scenario: Import users into a fresh database
    Given there are no users in the database
    When I import a CSV file with name, email, and manager email
    Then new users with manager relationships should be created

  Scenario: Import users into a populated database
    Given there are users in the database
    When I import a CSV file with name, email, and manager email
    Then existing users should be updated
    And new users should be created
