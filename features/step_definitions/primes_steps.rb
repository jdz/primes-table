Given(/^a sequence of primes$/) do
  @primes = Sieve::generate_primes
end

Given(/^the following numbers:$/) do |table|
  # table is a Cucumber::Ast::Table
  @given = table.raw.flatten.map do |n|
    n.to_i
  end
end

Then(/^the first primes are same as given numbers$/) do
  @given.each do |x|
    x.should eql(@primes.next)
  end
end

