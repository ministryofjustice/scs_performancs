Feature:
  As a manager
  I need to be able to formally approve objectives and reviews of my employees
  So that there is a permanent record of what was agreed between employee and manager

  Background:
    Given I am a manager
    And I log in

  Scenario: Manager approves a report
    And one of my employees has their agreement set
    When I approve that agreement
    Then The objectives are approved
    And The snapshot of those objectives is stored

