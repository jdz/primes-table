Feature: Primes using Sieve of Eratosthenes
  We want to be sure that our implementation of primes using Sieve of
  Eratosthenes as implemented as a filtered stream of integers is
  correct.

  Scenario: First 30 primes
    Given a sequence of primes
    And the following numbers:
      |   2 |   3 |   5 |   7 |  11 |
      |  13 |  17 |  19 |  23 |  29 |
      |  31 |  37 |  41 |  43 |  47 |
      |  53 |  59 |  61 |  67 |  71 |
      |  73 |  79 |  83 |  89 |  97 |
      | 101 | 103 | 107 | 109 | 113 |
    Then the first primes are same as given numbers
