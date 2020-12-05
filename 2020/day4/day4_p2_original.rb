# This is day4 part 2 as written at 12am

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

people << person

p (people.count do |person|
        x =(person.split(/\s/).map do |a| 
                ar = a.split(":")
                ar.length == 2 ? ar : nil
        end.compact.to_h)
        fields.all? { |f| x.keys.include?(f)} &&
        x['byr'][/^\d\d\d\d$/] && x['byr'].to_i >= 1920 && x['byr'].to_i <= 2020 &&
        x['iyr'][/^\d\d\d\d$/] && x['iyr'].to_i >= 2010 && x['iyr'].to_i <= 2020 &&
        x['eyr'][/^\d\d\d\d$/] && x['eyr'].to_i >= 2020 && x['eyr'].to_i <= 2030 &&
        (x['hgt']['cm'] ? x['hgt'].to_i >=150 && x['hgt'].to_i<=193 : x['hgt'].to_i > 59 && x['hgt'].to_i <= 76) &&
        x['hcl'][/^#[a-f0-9]{6}$/] &&
        %w(amb blu brn gry grn hzl oth).include?(x['ecl']) &&
        x['pid'][/^\d{9}$/]


end)

