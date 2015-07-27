Feature: User environment
  Background:
    Given the user home directory exists

  Scenario: SSH configured
    Given the local ssh config directory ".ssh" exists 
    When I list the content of ssh config dir
    Then I get an non-empty list of entries
    And I can find at least on pair of ssh keys
