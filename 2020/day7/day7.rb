require 'set'

DATA = File.read('input.txt').lines.map(&:strip).map(&:chop).map do |line|
  key, value = line.split(' bags contain ')
  value = value.split(", ").map do |v|
    q, b = v.split(' ', 2)
    b = b[0..-5].strip
    [q.to_i, b]
  end
  [key, value]
end.to_h


# part 1
#def find_containers(needle, quantity = 1, containers = Set.new)
#  DATA.each do |color, contains|
#    if contains.map(&:last).include?(needle)
#      containers << color
#    end
#  end
#  containers
#end
#
# containers = find_containers("shiny gold", 1)
#loop do
#  containers.to_a.each do |color|
#    find_containers(color, 1, containers)
#  end
#  p containers.length
#end

# part 2
def find_bags(color)
  return 0 unless DATA[color]
  out = 0
  DATA[color].each do |q, sub_bag|
    out += q + q * find_bags(sub_bag)
  end
  out
end

p find_bags("shiny gold")
