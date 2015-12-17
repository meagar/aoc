$inputs = [11, 30, 47, 31, 32, 36, 3, 1, 5, 3, 32, 36, 15, 11, 46, 26, 28, 1, 19, 3]

$num_solutions = 0

$ways = Hash.new(0)

def check(total, i, c)
  return unless $inputs[i] && total < 150
  if total + $inputs[i] == 150
    $num_solutions += 1 
    $ways[c + 1] += 1
  end

  check(total + $inputs[i], i + 1, c + 1)
  check(total, i + 1, c)
end

check(0, 0, 0)

p $num_solutions

p $ways[$ways.keys.min]
