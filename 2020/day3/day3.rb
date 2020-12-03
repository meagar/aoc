lines = File.read('input.txt').lines.map(&:strip)

inputs = [
    [1, 1],
		[3, 1],
		[5, 1],
		[7, 1],
		[1, 2]
]

total = inputs.map do |dx, dy|
  x = 0
  trees = 0
  lines.each.with_index do |line, index|
    next if index % dy != 0
    trees += 1 if line[x] == '#'
    x += dx
    x -= line.length if x >= line.length
  end
  trees
end.inject(:*)

puts total
