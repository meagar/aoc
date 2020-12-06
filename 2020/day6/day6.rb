groups = File.read('input.txt').split("\n\n")

# Part 1
#p groups.map { |g| g.lines.flat_map { |l| l.strip.chars }.uniq.count }.inject(&:+)

# Part 2
p groups.map { |g| g.lines.map { |l| l.strip.chars }.inject(&:&).count }.inject(&:+)
