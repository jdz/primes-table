# Write a program that calculates and prints out a multiplication
# table of the first 10 calculated prime numbers.

# Detail: The program must run from the command line and print to
# screen 1 table.

# Across the top and down the left side should be the 10 primes, and
# the body of the table should contain the product of multiplying
# these numbers.

require 'primes'

describe Sieve, "#infinity" do
  let(:inf) do
    described_class.infinity(0)
  end

  it "generates correct first 42k integers" do
    inf.take(42000).each_with_index do |n, i|
      n == i
    end
  end
end

describe Sieve, "#filter_multiples" do
  let(:inf) do
    described_class.infinity(1)
  end

  it "works with 2" do
    Sieve::filter_multiples(inf, 2).take(42000).none? do |n|
      n.even?
    end
  end
end

describe Sieve, "#generate_primes" do
  let(:primes) do
    described_class.generate_primes
  end

  it "generates correct first 30 elements" do
    # Primes from Sieve wikipedia page.
    expect(primes.take(30)).to eq([2,   3,   5,   7,   11,
                                   13,  17,  19,  23,  29,
                                   31,  37,  41,  43,  47,
                                   53,  59,  61,  67,  71,
                                   73,  79,  83,  89,  97,
                                   101, 103, 107, 109, 113])
  end
end

describe "#print_table" do
  it "generates correct multiplication table for [2, 3] and [2, 3, 4]" do
    io = StringIO.new
    table = print_table([2, 3], [2, 3, 4], io) do |a, b|
      a * b
    end
    lines = io.string.lines.map { |line| line.chomp }
    expect(lines).to eq(["  2  3",
                         "2 4  6",
                         "3 6  9",
                         "4 8 12"])
  end

  it "generates correct multiplication table for [2, 3, 5] and [2, 3, 5]" do
    io = StringIO.new
    table = print_table([2, 3, 5], [2, 3, 5], io) do |a, b|
      a * b
    end
    lines = io.string.lines.map { |line| line.chomp }
    expect(lines).to eq(["   2  3  5",
                         "2  4  6 10",
                         "3  6  9 15",
                         "5 10 15 25"])
  end

  it "generates correct subtraction table for [2, 3, 5] and [2, 3, 5]" do
    io = StringIO.new
    table = print_table([2, 3, 5], [2, 3, 5], io) do |a, b|
      a - b
    end
    lines = io.string.lines.map { |line| line.chomp }
    expect(lines).to eq(["   2  3 5",
                         "2  0  1 3",
                         "3 -1  0 2",
                         "5 -3 -2 0"])
  end
end
