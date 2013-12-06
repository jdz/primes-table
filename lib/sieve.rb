# Implementation of Sieve of Eratosthenes
# (http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes).
module Sieve
  # Returns an [infinite] enumeration of primes.
  def self.generate_primes
    Enumerator.new do |y|
      enum = infinity(2)
      loop do
        n = enum.first
        y << n
        enum = filter_multiples(enum, n)
      end
    end
  end

  # Given an enumeration, returns a new enumeration with all multiples
  # of n elided.
  def self.filter_multiples(enum, n)
    Enumerator.new do |y|
      loop do
        x = enum.next
        next if x.remainder(n).zero?
        y << x
      end
    end
  end

  # Returns an [infinite] enumerator of integers starting given
  # number.
  def self.infinity(from)
    Enumerator.new do |y|
      loop do
        y << from
        from += 1
      end
    end
  end
end
