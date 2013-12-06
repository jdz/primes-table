Given(/^an infinite sequence of integers starting at (\d+)$/) do |n|
  @start = n.to_i
end

Then(/^I can get at least (\d+) of them$/) do |n|
  @count = n.to_i
end

Then(/^they are monotonically increasing by one$/) do
  ints = Sieve::infinity(@start)
  @count.times do |i|
    ints.next.should eql(@start + i)
  end
end
