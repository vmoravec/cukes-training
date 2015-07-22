Feature: User environment
  Background:
    Given the user home directory exists
    And the home directory is not empty

  Scenario: SSH configured
    Given the local ssh config directory ".ssh" exists 
    When I list the content of ssh config dir
    Then I get an non-empty list entries
