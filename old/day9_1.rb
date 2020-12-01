DISTANCES = {
  Faerun: {Norrath: 129, Tristram: 58, AlphaCentauri: 13, Arbre: 24, Snowdin: 60, Tambi: 71, Straylight: 67},
  Norrath: {Tristram: 142, AlphaCentauri: 15, Arbre: 135, Snowdin: 75, Tambi: 82, Straylight: 54},
  Tristram: {AlphaCentauri: 118, Arbre: 122, Snowdin: 103, Tambi: 49, Straylight: 97},
  AlphaCentauri: {Arbre: 116, Snowdin: 12, Tambi: 18, Straylight: 91},
  Arbre: {Snowdin: 129, Tambi: 53, Straylight: 40},
  Snowdin: {Tambi: 15, Straylight: 99 },
  Tambi: {Straylight: 70}
}


places = DISTANCES.keys + [:Straylight]

def dist(a, b)
  (DISTANCES[a] && DISTANCES[a][b]) || (DISTANCES[b] && DISTANCES[b][a])
end

p (places.permutation.map do |perm|
  perm.first(7).map.with_index { |place,i| dist(place, perm[i + 1]) }.inject(&:+)
end.min)


