#
# validate_ownership_of_wallet.feature
#

Feature: Validate ownership of wallet with Metamask signature

  As a faucet owner
  I want to validate ownership of a wallet by requesting the user to sign a message with their connected Metamask

  Scenario: Request signature for ownership validation
    Given a user is connected to the faucet with their Metamask account
    When the faucet owner requests ownership validation
    Then the faucet should display a unique message or challenge for the user to sign with their Metamask account
    And provide clear instructions on how to sign the message using Metamask

  Scenario: Verify ownership with signature
    Given a user has signed the ownership validation message with their Metamask account
    When the signed message is submitted to the faucet
    Then the faucet should verify the signature using the corresponding Metamask account's public key
    And validate that the signature matches the expected message and account
    And confirm the ownership of the wallet

  Scenario: Reject invalid signature
    Given a user has provided an invalid or tampered signature for ownership validation
    When the signed message is submitted to the faucet
    Then the faucet should reject the signature as invalid
    And display an error message indicating that the ownership validation has failed

  Scenario: Handle signature validation errors
    Given an error occurs during the signature validation process
    When the signed message is submitted to the faucet
    Then the faucet should display a clear error message indicating the issue
    And suggest possible solutions to resolve the error, such as retrying the signature validation or contacting support

  Scenario: Compatibility and testing
    Given the faucet's functionality for validating ownership with Metamask signature
    When testing the faucet on different browsers and operating systems
    Then the faucet should work seamlessly and consistently verify the ownership of the wallet

  Scenario: Clear instructions for ownership validation
    Given a user wants to validate ownership of their wallet
    When the user accesses the faucet's help section or documentation
    Then the faucet should provide clear instructions on how to sign the ownership validation message using Metamask
    And guide the user through the process step-by-step
