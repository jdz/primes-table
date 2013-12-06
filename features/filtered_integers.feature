Feature: Multiple filtering
  We want to be able to filter out multiples of a specific integer out
  of a sequence (stream?) of integers.

  Scenario: Filtering
    
    Given a sequence of integers starting at 2
    And a filter that removes multiples of 2 from that sequence
    Then 42000 numbers from the filtered sequence does not contain even numbers
