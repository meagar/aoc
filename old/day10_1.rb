
input = '3113322113'.chars.map(&:to_i)

40.times do
  input = input.chunk { |x| x }.flat_map { |a,b| [b.length, a] }
end

p input.length
