$inputs = [11, 30, 47, 31, 32, 36, 3, 1, 5, 3, 32, 36, 15, 11, 46, 26, 28, 1, 19, 3]

$num_solutions = 0

def check(total, i)
  return unless $inputs[i] && total < 150
  if total + $inputs[i] == 150
    $num_solutions += 1 
  end

  check(total + $inputs[i], i + 1)
  check(total, i + 1)
end

check(0, 0)

p $num_solutions
