Feature: Infinite integers
  As a new cucumber user I want to try writing a test Using cukes

  Scenario: Integers
    Given an infinite sequence of integers starting at 1
    Then I can get at least 42000 of them
    And they are monotonically increasing by one
