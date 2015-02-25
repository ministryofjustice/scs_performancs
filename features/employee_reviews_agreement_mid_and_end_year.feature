Feature:
  As an employee
  I need to be able to comment on my performance at Mid-Year Review and End of Year Review
  So that I can keep my objectives up to date and deal with changing circumstances

  Background:
    Given I am an employee
    And I log in

  Scenario: Employee fills in their mid-year comment on agreement
    And I have an agreement approved
    When I enter my mid-year progress against my objectives
    Then my mid-year progress should be saved

  Scenario: Employee changes their mid-year comment on agreement
    And I have an agreement with mid-year progress
    When I change my mid-year progress against my objectives
    Then the changes are saved on my mid-year progress

  Scenario: Employee fills in their end-year review on agreement
    And I have an agreement and mid-year review approved
    When I enter my end-year progress against my objectives
    Then my end-year progress should be saved
