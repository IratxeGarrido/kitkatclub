puts "Creating Organisers"
Organiser.create(
  name: "Disco Bizarre",
  url: "https://discobizarre.com/",
  facebook: "https://www.facebook.com/discobizarre",
  instagram: "https://www.instagram.com/disco.bizarre/"
)

puts "#{Organiser.count} organisers created"
