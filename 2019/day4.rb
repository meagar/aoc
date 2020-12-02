
def candidate?(n)
  digits = n.to_s.chars.map(&:to_i)
  doubles = []
  digits.each_cons(2) do |a,b|
    return false if a > b
    doubles << a if a == b
  end
  return false if doubles.empty?

  doubles.uniq!

  doubles.any? { |d| n.to_s["#{d}#{d}#{d}"].nil? }
end

puts 272091.upto(815432).select { |n| candidate?(n) }.count
