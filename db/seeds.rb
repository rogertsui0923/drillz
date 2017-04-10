# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# leader = User.new(first_name: 'Basia', last_name: 'C', email: 'basia@c.com', password: 'secret', is_admin: true, is_approved: true)
# leader.save
# User.create(first_name: 'Kira', last_name: 'G', email: 'kira@g.com', password: 'secret', is_admin: true, is_approved: true)
# User.create(first_name: 'Nari', last_name: 'R', email: 'nari@r.com', password: 'secret', is_admin: true, is_approved: true)
# User.create(first_name: 'Mitchell', last_name: 'W', email: 'mitchell@w.com', password: 'secret', is_approved: true)
# User.create(first_name: 'Fernando', last_name: 'H', email: 'fernando@h.com', password: 'secret', is_approved: true)
# User.create(first_name: 'Alan', last_name: 'L', email: 'alan@l.com', password: 'secret')
User.create(first_name: 'Roger', last_name: 'Tsui', email: 'rogertsui0923@gmail.com', password: 'secret', is_admin: true, is_approved: true)

# ruby_hash = DrillGroup.new(name: 'Ruby Hashes', description: 'Drills involving Ruby hashes', level: 'beginner', points: 100)
# js_string = DrillGroup.create(name: 'Javascript Strings', description: 'Drills involving Javascript strings', level: 'difficult', points: 400)
# ruby_hash.save
# js_string.save
#
# d1 = Drill.new(description: 'Given that h = {a: 1}, access the value 1 corresponding to key "a".', drill_group: ruby_hash)
# d2 = Drill.new(description: 'Given that h = {a: 1, b: 2}, iterate through the hash and print out the keys.', drill_group: ruby_hash)
# d3 = Drill.new(description: 'Given s = "hello world", return ["hello", "world"].', drill_group: js_string)
# d1.save
# d2.save
# d3.save
#
# Solution.create(body: 'h[:a]', drill: d1)
# Solution.create(body: 'h.each { |k, v| puts k }', drill: d2)
# Solution.create(body: 'h.each do |k, v| puts k end', drill: d2)
# Solution.create(body: 's.split(" ")', drill: d3)
