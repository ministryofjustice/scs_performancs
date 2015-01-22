Feature:
  As a manager
  I need to be able to formally approve the contents of the form
  So that there is a permanent record of what was agreed between employee and manager

  Scenario: Manager approves a report
    Given I am a manager
    And I one of my employees has their objectives set
    When I approve those objectives
    Then The objectives are approved
    And The snapshot of those objectives is stored

  Scenario: Manager approves mid-year progress
    Given I am a manager
    And I one of my employees has their mid-year review filled
    When I approve this mid-year review
    Then The review is approved
    And The snapshot of the objectives is stored

  Scenario: Manager approves end-year progress
    Given I am a manager
    And I one of my employees has their end-year review filled
    When I approve this end-year review
    Then The review is approved
    And The snapshot of the objectives is stored