Feature:
  As anyone accessing the application
  I want a quick and easy way to access my personal 'dashboard'
  So that I can access my appraisal documents

  Background:
    Given There are some users and reports already in the system

  Scenario: logging in and seeing my dashboard
    Given I am an employee
    And I have an existing report
    When I request access using my e-mail
    And I click on the link in the e-mail
    Then I should see a dashboard page with my performance reports

  @wip
  Scenario: viewing my dashboard when I have employees
    Given I am a manager
    When I request access using my e-mail
    And I click on the link in the e-mail
    Then I should see a dashboard page with my performance reports
    And I should see performance reports of my employees