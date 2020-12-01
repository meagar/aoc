#Rudolph can fly 22 km/s for 8 seconds, but then must rest for 165 seconds.
#Cupid can fly 8 km/s for 17 seconds, but then must rest for 114 seconds.
#Prancer can fly 18 km/s for 6 seconds, but then must rest for 103 seconds.
#Donner can fly 25 km/s for 6 seconds, but then must rest for 145 seconds.
#Dasher can fly 11 km/s for 12 seconds, but then must rest for 125 seconds.
#Comet can fly 21 km/s for 6 seconds, but then must rest for 121 seconds.
#Blitzen can fly 18 km/s for 3 seconds, but then must rest for 50 seconds.
#Vixen can fly 20 km/s for 4 seconds, but then must rest for 75 seconds.
#Dancer can fly 7 km/s for 20 seconds, but then must rest for 119 seconds.

DEER = {
  Rudolph: [22, 8, 165],
  Cupid: [8, 17, 114],
  Prancer: [18, 6, 103],
  Donner: [25, 6, 145],
  Dasher: [11, 12, 125],
  Comet: [21, 6, 121],
  Blitzen: [18, 3, 50],
  Vixen: [20, 4, 75],
  Dancer: [7, 20, 119],
}

points = Hash.new(0)

D = 2503

1.upto(D) do |time|
  winner = DEER.max_by do |deer, (speed, duration, rest)|
    t = duration + rest
    ((time.to_f / t).floor * duration * speed) + (speed * [duration, time % t].min)
  end.first

  points[winner] += 1
end

p points.max_by(&:last)
