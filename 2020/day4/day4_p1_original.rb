# This is my part 1 solution, as written at 12am

fields = %w(byr iyr eyr hgt hcl ecl pid)

people = []
person =  ""

File.read('input.txt').lines.map(&:strip).each do |line|
        if line == ""
                people << person
                person = ""
        else
                person += " " + line        
        end
end

# I Forgot this line, and left stuff in the buffer, causing me to get a wrong answer and
# knocking me out of leaderboard contention
people << person

p (people.count do |person|
        x =(person.split(/\s/).map do |a| 
                ar = a.split(":")
                ar.length == 2 ? ar : nil
        end.compact.to_h)
        fields.all? { |f| x.keys.include?(f)} && true # x.keys.all? { (['cid'] + fields).include?(x) }
end)

