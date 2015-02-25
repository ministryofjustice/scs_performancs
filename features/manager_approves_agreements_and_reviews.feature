Feature:
  As a manager
  I need to be able to formally approve performance agreement and reviews of my employees
  So that there is a permanent record of what was agreed between employee and manager

  Background:
    Given I am a manager
    And I log in

  Scenario: Manager approves a performance agreement
    And one of my employees has their agreement set
    When I approve that agreement
    Then the agreement is approved
    And the snapshot of that agreement is stored

