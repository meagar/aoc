INPUT = 'vzbxkghb'

# Passwords must contain at least two different, non-overlapping pairs of letters, like aa, bb, or zz.
# hahaha nope
p (INPUT.next.upto('zzzzzzzz').find do |pw|
  !pw[/[iol]/] && pw[/(.)\1.*(.)\2/] && pw.chars.each_cons(3).any? { |t| t[0].next == t[1] && t[1].next == t[2] }
end)
