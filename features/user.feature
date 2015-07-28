Feature: User
  Scenario: SSH configured
    When the user home directory exists
    And the config directory .ssh exists 
    And I list the content of ssh config dir
    Then I get an non-empty list of entries
