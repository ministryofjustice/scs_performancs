Feature:
  As an employee
  I need to be able to state my progress against each individual objective at Mid-Year Review and End of Year Review
  So that I can keep my objectives up to date and deal with changing circumstances

  Background:
    Given I am an employee
    And I log in

  Scenario: Employee fills in their mid-year review
    And I have some objectives approved
    When I enter my mid-year progress against my objectives
    Then my mid-year progress should be saved

  Scenario: Employee changes their mid-year review
    And I have some objectives with mid-year progress
    When I change my mid-year progress against my objectives
    Then the changes are saved on my mid-year progress

  Scenario: Employee fills in their end-year review
    And I have some objectives and mid-year review approved
    When I enter my end-year progress against my objectives
    Then my end-year progress should be saved

  Scenario: Employee changes their end-year review
    And I have some objectives, mid-year review and end-year review in progress
    When I change my end-year progress against my objectives
    Then the changes are saved on my end-year progress
