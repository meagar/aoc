
strings = $stdin.readlines.map(&:chomp)

p (strings.map { |s| s.gsub(/["\\]/,'\\\\\0').length + 2 }.inject(&:+) - strings.map(&:length).inject(&:+))
