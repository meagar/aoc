
lines = File.read('input.txt').lines.map(&:strip)

L = 1
R = 2

def bin(steps, min = 0, max = 127)
  return min if min == max

  step = steps.shift
  diff = ((max - min).fdiv(2)).ceil

  if step == L
    bin(steps, min, max - diff)
  else
    bin(steps, min + diff, max)
  end
end

def seat_id(pass)
  r = pass[0..6].chars.map { |c| c == 'F' ? L : R }
  a = pass[7..-1].chars.map { |c| c == 'L' ? L : R }
  row_id =  bin(r, 0, 127)
  aisle_id = bin(a, 0, 7)
  return row_id * 8 + aisle_id
end

seats = lines.map { |line| seat_id(line) }

# part 1
# p seats.max

# part 2
min, max = seats.minmax
min.upto(max).each do |i|
  puts i unless seats.include?(i)
end
