Feature:
  As anyone accessing the application
  I want a quick and easy way to access my personal 'dashboard'
  So that I can access my appraisal documents

  Background:
    Given There are some users and reports already in the system

  Scenario: logging in with incorrect email
    Given I am an employee
    When I request access using incorrect e-mail
    Then I see login error message

  Scenario: logging in and seeing my dashboard
    Given I am an employee
    And I have some objectives and mid-year review approved
    When I request access using my e-mail
    And I click on the link in the e-mail
    Then I see a dashboard page with my performance reports
    And I see performance report approval dates

  Scenario: viewing my dashboard when I have employees
    Given I am a manager
    And I have an existing report
    And I have employees with reports filled
    When I request access using my e-mail
    And I click on the link in the e-mail
    Then I see a dashboard page with my performance reports
    And I see performance reports of my employees
    And I see employee reports approval status
