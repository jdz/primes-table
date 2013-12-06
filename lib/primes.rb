#!/usr/bin/env ruby

require_relative 'sieve'

# No arguments to change table operation since task description asked
# for multiplication only.
def main(limit)
  primes = Sieve::generate_primes.take(limit)
  print_table(primes, primes) do |x, y|
    x * y
  end
end

# I would use 'text-table' gem, but it does not have an option to have
# row headings, and no way to disable line-art.
def print_table(cols, rows, out = $stdout)
  raise "Do not know how to calculate table values!" unless block_given?

  table = []

  # Header row.
  table << [""] + cols.map { |col| col.to_s }

  # Calculate values (and convert them to strings immediately for
  # colmn width calculation).
  rows.each do |row|
    trow = [row.to_s]
    cols.each do |col|
      trow << yield(col, row).to_s
    end
    table << trow
  end

  widths = table.transpose.map do |col|
    col.map { |str| str.length }.max
  end

  table.each do |row|
    row.each_with_index do |str, i|
      out.print(str.rjust(widths[i] + (i.zero? ? 0 : 1)))
    end
    out.puts
  end

  table
end

