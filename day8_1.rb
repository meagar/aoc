
strings = $stdin.readlines.map(&:chomp)

p  strings.map(&:length).inject(&:+) - strings.map { |s| eval(s).length }.inject(&:+)
