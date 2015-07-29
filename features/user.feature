Feature: User
  Scenario: SSH configured
    When the user home directory exists
    And the config directory .ssh exists 
    And I list the content of ssh config dir
    Then I get an non-empty list of entries
    And the public key "id_rsa.pub" is present
    And the private key "id_rsa" is present
