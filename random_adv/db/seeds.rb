# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Adventure.create({location: 'ChIJtcaxrqlZwokRfwmmibzPsTU', price_per_person: false, price_event: 0, timeframe: 2, hints: "King Kong's jungle gym"})
Adventure.create({location: 'ChIJ-4MbiBlawokR5ixJ4E8Km5c', price_per_person: false, price_event: 0, timeframe: 1, hints: "Freedom tower"})
Adventure.create({location: 'ChIJlRYp-4xYwokRqtwtQBYVz80', price_per_person: false, price_event: 0, timeframe: 1, hints: "Strawberry fields"})
Adventure.create({location: 'ChIJmQJIxlVYwokRLgeuocVOGVU', price_per_person: false, price_event: 0, timeframe: 1, hints: "Times Square"})
Adventure.create({location: 'ChIJK3vOQyNawokRXEa9errdJiU', price_per_person: false, price_event: 0, timeframe: 2, hints: "Brooklyn bridge"})
Adventure.create({location: 'ChIJ65rH6TBawokRUuhYOuefE28', price_per_person: false, price_event: 0, timeframe: 3, hints: "Smorgasburg"})
Adventure.create({location: 'ChIJYZrvCIFZwokRW3Xf3V0BWnU', price_per_person: true, price_event: 28, timeframe: 2, hints: "Escape the Room Downtown"})
Adventure.create({location: 'ChIJHW8b6qhZwokRJtwCEu3NV3w', price_per_person: true, price_event: 28, timeframe: 2, hints: "Escape the Room Midtown"})
Adventure.create({location: 'ChIJ5bQPhMdZwokRkTwKhVxhP1g', price_per_person: false, price_event: 0, timeframe: 1, hints: "High Line"})
Adventure.create({location: 'ChIJNZvR1v5YwokRFHSjCAPwtIs', price_per_person: true, price_event: 30, timeframe: 2, hints: "Top of The Rock"})
Adventure.create({location: 'ChIJ9QDTS7pZwokRJCPIsMF2Kiw', price_per_person: false, price_event: 45, timeframe: 1, hints: "Chelsea Driving Range Simulator"})
Adventure.create({location: 'ChIJaQ2FO55ZwokRKYAlmF0IlzA', price_per_person: false, price_event: 0, timeframe: 2, hints: "Crocodile lounge"})
Adventure.create({location: 'ChIJkXQ3_INZwokRE74ZvG46Jjc', price_per_person: false, price_event: 0, timeframe: 2, hints: "Momofuko noodle bar"})
Adventure.create({location: 'ChIJFTweVbZZwokRNkSu_ncOwJs', price_per_person: true, price_event: 85, timeframe: 2, hints: "Sleep no more"})

User.create({name: 'Matt', email: 'Matt@wingit.com', password_digest: 'password'})
User.create({name: 'Sam', email: 'Sam@wingit.com', password_digest: 'password'})
User.create({name: 'Ethan', email: 'Ethan@wingit.com', password_digest: 'password'})
User.create({name: 'David', email: 'David@wingit.com', password_digest: 'password'})