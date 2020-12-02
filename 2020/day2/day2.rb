#!/usr/bin/env ruby
lines = File.read('input.txt').each_line.map(&:strip).map { |l| l.split(': ', 2) }

valid = lines.count do |rule, password|
  minmax,char = rule.split(' ')
  min, max = minmax.split('-').map(&:to_i)

  chars = password.chars

  # part 1
  # n = chars.count { |c| c == char }
  # n >= min && n <= max

  # part 2
  a = chars[min - 1] == char
  b = chars[max - 1] == char

  a != b
end
p valid
