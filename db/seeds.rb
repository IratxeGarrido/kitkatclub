# require 'faker'

puts 'Destroying all seeds...'
Event.destroy_all
Organiser.destroy_all
User.destroy_all
puts 'Seeds destroyed'

puts 'Creating Organisers...'
organiser = Organiser.new(
  name: 'Disco Bizarre',
  url: 'https://discobizarre.com/',
  facebook: 'https://www.facebook.com/discobizarre',
  instagram: 'https://www.instagram.com/disco.bizarre/'
)
organiser.save!
puts "#{Organiser.count} organisers created!"

puts 'Creating Events...'
(1..10).each do |i|
  Event.create!(
    title: "Event #{i}",
    location: 'Basement',
    recurrence: Montrose.daily(total: 10),
    line_up: 'Cool line up',
    style: "Style #{i}",
    special: 'music',
    dresscode: 'fancy',
    organiser_id: organiser.id
  )
end
puts "#{Event.count} events created!"

User.create!(
  email: "iratxe@example.com",
  password: "123456"
)
