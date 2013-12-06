Given(/^a sequence of integers starting at (\d+)$/) do |n|
  @ints = Sieve::infinity(n.to_i)
end

Given(/^a filter that removes multiples of (\d+) from that sequence$/) do |n|
  @filtered = Sieve::filter_multiples(@ints, n.to_i)
end

Then(/^(\d+) numbers from the filtered sequence does not contain even numbers$/) do |n|
  n.to_i.times do
    @filtered.next.even?.should be_false
  end
end
