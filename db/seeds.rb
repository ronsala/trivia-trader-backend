# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'

Category.destroy_all
Game.destroy_all
Question.destroy_all
User.destroy_all

['Arts & Entertainment', 'Games & Sports', 'History', 'Science & Tech', 'Hodge Podge'].each do |c|
  Category.create(name: c)
end

20.times do
  User.create(
    username: Faker::Name.unique.name,
    email: Faker::Internet.email,
    password: 'password'
  )
end

Game.create(title: 'Controversy on Canvas', category_id: Category.find_by(name: 'Arts & Entertainment').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Question.create(game_id: Game.last.id, q: "Salvador Dali's 'The Enigma of William Tell' offended many because:", aa: "It was based on an idea stolen from Picaso.", ab: "It was dedicated to Spanish dictator Francisco Franco.", ac: "It was painted in human blood.", ad: "It depicted a half-naked Vladimir Lenin.", correct: 'd', link: "https://www.sleek-mag.com/article/controversial-artworks/")

Question.create(game_id: Game.last.id, q: "Albrecht Dürer's 1500 Self-Portrait was controversial for its depiction of the artist:", aa: "giving an obscene gesture", ab: "nude", ac: "as Christ", ad: "defacing a church", correct: '', link: "http://alternativemindz.com/2014/11/top-15-most-controversial-art-paintings-of-all-time/")

Question.create(game_id: Game.last.id, q: "In 1953, Robert Rauschenberg sparked controversy by displaying:", aa: "a finger painting showing his mother as Uncle Sam", ab: "a piece of paper after he had erased the drawing another artist had created on it", ac: "his underwear in an elaborate frame", ad: "a radioactive depiction of a mushroom cloud", correct: 'b', link: "https://en.wikipedia.org/wiki/Erased_de_Kooning_Drawing")

Question.create(game_id: Game.last.id, q: "Cedric Chamber's 'The Prophet' shows Jesus being carried by:", aa: "Darth Vader", ab: "Andy Warhol", ac: "Donald Trump", ad: "Ruth Bader Ginsburg", correct: 'a', link: "https://www.lolwot.com/10-of-the-most-controversial-paintings-ever-created/")

Question.create(game_id: Game.last.id, q: "Sarah Sole was inspired by a dream to produce more than 40 paintings of this politician:", aa: "Franklin Roosevelt", ab: "Andrew Yang", ac: "Boris Yeltzin", ad: "Hillary Clinton", correct: 'd', link: "https://www.rollingstone.com/culture/culture-news/meet-the-controversial-artist-who-creates-surreal-paintings-of-hillary-clinton-33450/")

Game.create(title: 'Musical Conspiracy Theories', category_id: Category.find_by(name: 'Arts & Entertainment').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Question.create(game_id: Game.last.id, q: "This singer's bare feet on an album cover was interpreted by some as a clue they had died and been replaced by a lookalike:", aa: "Frank Sinatra", ab: "Paul McCartney", ac: "Joan Jett", ad: "Justin Bieber", correct: 'b', link: "https://www.bbc.co.uk/programmes/articles/3L81VM3BPSHW9L3KTsRnm6K/the-strangest-musical-conspiracy-theories")

Question.create(game_id: Game.last.id, q: "Iconography used by such musicians as Jay-Z, Beyoncé, Kanye West, and Kesha has led to speculation they belong to what organization?:", aa: "The John Birch Society", ab: "The Muslim Brotherhood", ac: "The Make a Wish Foundaion", ad: "The Illuminati", correct: 'd', link: "https://news.artnet.com/opinion/apeshit-art-1304999")

Question.create(game_id: Game.last.id, q: "A video of an 8-year-old in a beehive hairdo led to claims it was a childhood work of what singer:", aa: "Kate Pierson", ab: "Ronnie Spector", ac: "Amy Winehouse", ad: "Cindy Wilson", correct: 'c', link: "https://www.radiox.co.uk/features/best-musical-hoax-prank-conspiracy-theories/")

Question.create(game_id: Game.last.id, q: "What singer's album featuring a 'K. WEST' sign was said to predict Kanye West's superstardom 5 years before he was born:", aa: "Otis Redding", ab: "Aretha Franklin", ac: "Frank Sinatra", ad: "David Bowie", correct: 'd', link: "https://ultimateclassicrock.com/music-conspiracy-theories/")

Question.create(game_id: Game.last.id, q: "Murdered child beauty pageant winner JonBenét Ramsey is rumored to have not died and grown up to be:", aa: "Billie Eilish", ab: "Lady Gaga", ac: "Katy Perry", ad: "Dua Lipa", correct: 'c', link: "https://happymag.tv/here-are-the-10-wackiest-musical-conspiracy-theories-of-all-time/")

Game.create(title: 'Ruler Rules', category_id: Category.find_by(name: 'Games & Sports').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Question.create(game_id: Game.last.id, q: "The recommended depth of an Olympic-size pool is:", aa: "3 meters", ab: "10 meters", ac: "1 meter", ad: "7 meters", correct: 'a', link: "https://en.wikipedia.org/wiki/Olympic-size_swimming_pool")

Question.create(game_id: Game.last.id, q: "According to the Official Baseball Rules, each of these dimensions is exactly specified except:", aa: "the distance between bases", ab: "the diameter of the pitcher's mound", ac: "the distance from home base to the outfield fence", ad: "the dimensions of each base", correct: 'ac', link: "https://en.wikipedia.org/wiki/Baseball_field#Specifications")

Question.create(game_id: Game.last.id, q: "An official garden croquet lawn measures:", aa: "20x35 meters", ab: "10.5x7 meters", ac: "15.33x10 meters", ad: "100x50 meters", correct: 'b', link: "https://www.croquet.org.uk/?p=games/garden/rules/GardenRules")

Question.create(game_id: Game.last.id, q: "An official USBC bowling lane measures how many feet from fowl line to head pin?:", aa: "70", ab: "50", ac: "35", ad: "60", correct: 'd', link: "https://bowlingforbeginners.com/bowling-lane-dimensions/")

Question.create(game_id: Game.last.id, q: "The world's longest golf hole measures how many meters?:", aa: "101", ab: "513", ac: "793", ad: "881", correct: 'd', link: "https://www.guinnessworldrecords.com/world-records/64203-longest-golf-hole/")

Game.create(title: 'The Great War', category_id: Category.find_by(name: 'History').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Question.create(game_id: Game.last.id, q: "World War I started after the assassination of Franz Ferdinand in this city:", aa: "New York", ab: "London", ac: "Sarajevo", ad: "Vienna", correct: 'c', link: "https://en.wikipedia.org/wiki/World_War_I")

Question.create(game_id: Game.last.id, q: "World War I was the first war to feature all of these except:", aa: "gas masks", ab: "tank battles", ac: "napalm", ad: "aircraft carrier", correct: 'c', link: "https://cdn.britannica.com/15/177515-050-7C4AC18B/collection-facts-World-War-I.jpg")

Question.create(game_id: Game.last.id, q: "Between 1914 and 1918 Britain produced over 170 million:", aa: "rifles", ab: "airplanes", ac: "tanks", ad: "rounds of artillery shells", correct: 'd', link: "https://www.iwm.org.uk/history/5-things-you-need-to-know-about-the-first-world-war")

Question.create(game_id: Game.last.id, q: "Britain's 'bantam battalions' used:", aa: "chickens", ab: "Javanese immigrants", ac: "short men", ad: "conscientious objectors", correct: 'c', link: "https://www.historyextra.com/period/first-world-war/facts-first-world-war-one-ww1-armistice-dates-triple-alliance-triple-entente/")

Question.create(game_id: Game.last.id, q: "The first declaration of war in World War I was:", aa: "US on Germany", ab: "Italy on Britain", ac: "France on Belgium", ad: "Austria-Hungary on Serbia", correct: 'd', link: "https://www.historyhit.com/facts-that-tell-the-story-of-world-war-one/")

Game.create(title: 'The Solar System', category_id: Category.find_by(name: 'Science & Tech').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Question.create(game_id: Game.last.id, q: "How many moons have been discovered in our solar system:", aa: "23", ab: "1", ac: "9387", ad: "194", correct: 'd', link: "https://space-facts.com/solar-system/")

Question.create(game_id: Game.last.id, q: "All these planets are visible to the naked eye except:", aa: "Mars", ab: "Mercury", ac: "Uranus", ad: "Saturn", correct: 'c', link: "http://www.nakedeyeplanets.com/")

Question.create(game_id: Game.last.id, q: "Which planet features a giant hexagon?:", aa: "Uranus", ab: "Saturn", ac: "Venus", ad: "Jupiter", correct: 'b', link: "https://www.space.com/22-top-10-extreme-planet-facts.html")

Question.create(game_id: Game.last.id, q: "The Oort Cloud is made up of:", aa: "asteroids", ab: "smog", ac: "comets", ad: "debris from space missions", correct: 'c', link: "https://theplanets.org/solar-system/")

Question.create(game_id: Game.last.id, q: "Which planet has the highest average temperature, at 875 degrees Fahrenheit (468 Celsius):", aa: "Mercury", ab: "Venus", ac: "Mars", ad: "Neptune", correct: 'b', link: "https://earthsky.org/space/ten-things-you-may-not-know-about-the-solar-system")

Game.create(title: 'Starts With L', category_id: Category.find_by(name: 'Hodge Podge').id, user_id: Faker::Number.between(from: User.first.id, to: User.last.id))

Question.create(game_id: Game.last.id, q: "The petal of an orchid:", aa: "labellum", ab: "labiovelar", ac: "labrid", ad: "laccolith", correct: 'a', link: "https://www.dictionary.com/browse/labellum")

Question.create(game_id: Game.last.id, q: "Used for informal communication on the Internet:", aa: "lycian", ab: "lunt", ac: "leetspeak", ad: "lustreware", correct: 'c', link: "https://www.dictionary.com/browse/leetspeak")

Question.create(game_id: Game.last.id, q: "A city in Poland:", aa: "Lvov", ab: "Lwoff", ac: "Lucerne", ad: "Luzhou", correct: 'a', link: "https://www.dictionary.com/browse/lvov")

Question.create(game_id: Game.last.id, q: "British informal word for ear:", aa: "lump hammer", ab: "lumbus", ac: "lud", ad: "lughole", correct: 'd', link: "https://www.dictionary.com/browse/lughole")

Question.create(game_id: Game.last.id, q: "An Indian beverage:", aa: "lek", ab: "lassi", ac: "laten", ad: "lmao", correct: 'b', link: "https://www.dictionary.com/browse/lassi")