
# Print HelloWorld with simple iterators

string = "HelloWorld"

puts "Using split : "
string.split.each{ |i| print i }
puts "\n\n"

puts "Using Times : "
1.times do puts string end
puts

puts "Range : "
(1..1).each { |i| puts string }
puts

puts "Step : "
(1..1).step(1) do |i| puts string end
puts

puts "Each Char : "
string.each_char { |i| print i }
puts "\n\n"

puts "Upto : "
1.upto(1) do |n| puts string end
puts

