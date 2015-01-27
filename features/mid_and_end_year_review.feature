Feature:
  As an employee
  I need to be able to state my progress against each individual objective at Mid-Year Review and End of Year Review
  So that I can keep my objectives up to date and deal with changing circumstances

  Scenario: Employee fills in their mid-year review
    Given I am an employee
    And I log in
    And I have some objectives approved
    When I enter my mid-year progress against my objectives
    Then my mid-year progress should be saved

  Scenario: Employee fills in their mid-year review
    Given I am an employee
    And I log in
    And I have some objectives with mid-year progress
    When I change my mid-year progress against my objectives
    Then the changes are saved on my mid-year progress

  Scenario: Employee fills in their end-year review
    Given I am an employee
    And I log in
    And I have some objectives and mid-year review approved
    When I enter my end-year progress against my objectives
    Then my end-year progress should be saved

  Scenario: Employee fills in their end-year review
    Given I am an employee
    And I log in
    And I have some objectives, mid-year review and end-year review in progress
    When I change my end-year progress against my objectives
    Then the changes are saved on my end-year progress

  Scenario: Manager tries to fill employee's mid-year review
    Given I am a manager
    And I log in
    And one of my employees has their objectives approved
    When I try to enter my employee's mid-year review
    Then I get an access error

  Scenario: Manager tries to fill employee's end-year review
    Given I am a manager
    And I log in
    And one of my employees has their mid-year review approved
    When I try to enter my employee's end-year review
    Then I get an access error