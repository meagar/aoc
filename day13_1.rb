weights = {
  Alice: { Bob: -2, Carol: -62, David: 65, Eric: 21, Frank: -81, George: -4, Mallory: -80 },
  Bob: { Alice: 93, Carol: 19, David: 5, Eric: 49, Frank: 68, George: 23, Mallory: 29 },
  Carol: { Alice: -54, Bob: -70, David: -37, Eric: -46, Frank: 33, George: -35, Mallory: 10 },
  David: { Alice: 43, Bob: -96, Carol: -53, Eric: -30, Frank: -12, George: 75, Mallory: -20 },
  Eric: { Alice: 8, Bob: -89, Carol: -69, David: -34, Frank: 95, George: 34, Mallory: -99 },
  Frank: { Alice: -97, Bob: 6, Carol: -9, David: 56, Eric: -17, George: 18, Mallory: -56 },
  George: { Alice: 45, Bob: 76, Carol: 63, David: 54, Eric: 54, Frank: 30, Mallory: 7 },
  Mallory: { Alice: 31, Bob: -32, Carol: 95, David: 91, Eric: -66, Frank: -75, George: -99 },
}

p (weights.keys.permutation.map do |perm|
  perm.map.with_index do |person, position|
    weights[person][perm[position - 1]] + weights[person][perm[position + 1] || perm[0]]
  end.inject(&:+)
end).max
