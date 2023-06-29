#
# limited_drop_IP_address.feature
#
# All the scenarios in this feature file are high level

Feature: Limit user's IP address for token requests

  As a faucet owner
  I want to limit a user's IP address so that they can request faucet tokens only once per day from that IP address

  Scenario: Allow token request from a new IP address
    Given a user with a unique IP address requests tokens from the faucet
    When the user's token request is processed
    Then the faucet should allow the request and distribute tokens to the user
    And record the user's IP address and the time of the request for future reference

  Scenario: Reject token request from the same IP address within 24 hours
    Given a user with the same IP address requests tokens from the faucet within 24 hours of their previous request
    When the user's token request is processed
    Then the faucet should reject the request
    And display an error message indicating that the user has already requested tokens from the same IP address within the last 24 hours

  Scenario: Track IP addresses accurately
    Given the faucet accurately tracks and records the IP addresses of users requesting tokens
    When multiple users with different IP addresses request tokens from the faucet
    Then the faucet should correctly identify and differentiate between the unique IP addresses
    And enforce the one-request-per-day limit for each IP address independently

  Scenario: Handle IP address validation errors
    Given an error occurs during the IP address validation process
    When processing a user's token request
    Then the faucet should display a clear error message indicating the issue
    And suggest possible solutions to resolve the error, such as retrying the request or contacting support

  Scenario: Compatibility and testing
    Given the faucet's functionality for limiting token requests per IP address
    When testing the faucet on different browsers and operating systems
    Then the faucet should work seamlessly and consistently enforce the one-request-per-day limit for each IP address

  Scenario: Communicate IP address limit to the user
    Given a user's token request is rejected due to reaching the limit for their IP address
    When the user receives the error message
    Then the faucet should clearly communicate that further requests from the same IP address are not allowed within the 24-hour period
    And provide information on when the user can make the next token request from that IP address
