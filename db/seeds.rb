# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


USERS_COUNT = 20
TRACKS_BY_OPINION_MIN = 5
TRACKS_BY_OPINION_MAX = 15
VOTES_BY_TRACK_MIN = 0
VOTES_BY_TRACK_MAX = 5

puts ''
puts '-------------------------------------------------------------------------'
puts 'CREATING DEMO USERS AND ADMINS'

user1 = User.create!(
    email: 'user1@mail.com',
    password: 'azerty',
    username: 'Pierre',
    birth_year: 1987,
    city: 'Lyon',
    photo: '',
    admin: false
)

puts  "user1@mail.com  | azerty (ID: #{user1.id})"

user2 = User.create!(
    email: 'user2@mail.com',
    password: 'azerty',
    username: 'Paul',
    username: 'Jane Doe',
    birth_year: 1987,
    city: 'Lyon',
    photo: '',
    admin: false
)

puts  "user2@mail.com  | azerty (ID: #{user2.id})"

admin1 = User.create!(
    email: 'admin1@mail.com',
    password: 'azerty',
    username: 'Paul',
    username: 'Jane Doe',
    birth_year: 1987,
    city: 'Lyon',
    photo: '',
    admin: true
)

puts  "admin1@mail.com | azerty (ID: #{admin1.id})"

admin2 = User.create!(
    email: 'admin2@mail.com',
    password: 'azerty',
    username: 'Jack',
    birth_year: 1987,
    city: 'Lyon',
    photo: '',
    admin: true
)

puts  "admin2@mail.com | azerty (ID: #{admin2.id})"

puts ''
puts '-------------------------------------------------------------------------'
puts "CREATING #{USERS_COUNT} USERS"

USERS_COUNT.times do
  User.create!(
    email: Faker::Internet.email << rand(0..9).to_s,
    password: 'azerty',
    username: Faker::Internet.username,
    birth_year: 1970,
    city: Faker::Address.city,
    photo: "https://randomuser.me/api/portraits/#{['men', 'women'].sample}/#{rand(1..50)}.jpg",
    admin: false
  )
  print '#'
end

puts ''
puts '-------------------------------------------------------------------------'
puts 'CREATING GENRES'

classical = Genre.create(
  name: 'classique',
  photo: 'https://cdn.pixabay.com/photo/2016/11/19/09/57/classical-music-1838390_960_720.jpg'
)

electro = Genre.create(
  name: 'electro',
  photo: 'https://cdn.pixabay.com/photo/2018/08/29/02/09/sound-table-3638995_960_720.jpg'
)

rock = Genre.create(
  name: 'rock',
  photo: 'https://cdn.pixabay.com/photo/2017/09/02/18/52/musician-2708190_960_720.jpg'
)

jazz = Genre.create(
  name: 'jazz',
  photo: 'https://cdn.pixabay.com/photo/2013/10/22/23/21/jazz-199547_960_720.jpg'
)

rap = Genre.create(
  name: 'rap',
  photo: 'https://cdn.pixabay.com/photo/2016/11/21/13/36/man-1845432_960_720.jpg'
)

folk = Genre.create(
  name: 'folk',
  photo: 'https://cdn.pixabay.com/photo/2015/05/07/11/02/guitar-756326_960_720.jpg'
)

pop = Genre.create(
  name: 'pop',
  photo: 'https://cdn.pixabay.com/photo/2016/01/19/17/56/concert-1149979_960_720.jpg'
)

metal = Genre.create(
  name: 'metal',
  photo: 'https://cdn.pixabay.com/photo/2016/10/17/16/35/concert-1748102_960_720.jpg'
)

chanson = Genre.create(
  name: 'chanson',
  photo: 'https://cdn.pixabay.com/photo/2014/09/22/00/56/lead-singer-455750_960_720.jpg'
)

opinions = [
  {
    name: "La chanson française, depuis Brassens, c'est vraiment toujours la même chose",
    main_genre_id: chanson.id
  },
  {
    name: "Les paroles dans le rap sont vraiment pauvres",
    main_genre_id: rap.id
  },
  {
    name: "Le jazz, c'est aussi ennuyeux que la musique d'ascenseur",
    main_genre_id: jazz.id
  },
  {
    name: "L'opéra, ce ne sont que des histoires tristes et datéés",
    main_genre_id: classical.id
  },
  {
    name: "Le rock, c'est toujours les mêmes trois accords",
    main_genre_id: rock.id
  },
  {
    name: "Le classique, il faut s'y connaître pour apprécier",
    main_genre_id: classical.id
  },
  {
    name: "Le rap, c'est par des mecs, pour des mecs",
    main_genre_id: rap.id
  },
  {
    name: "Le rap est toujours misogyne",
    main_genre_id: rap.id
  },
  {
    name: "Le jazz c'est des mecs qui jouent n'importe comment sous prétexte d'improvisation",
    main_genre_id: jazz.id
  },
  {
    name: "Le jazz n’a pas changé depuis les années 40",
    main_genre_id: jazz.id
  },
  {
    name: "La pop, c'est de la musique 'girly'",
    main_genre_id: pop.id
  },
  {
    name: "Le rock n’a pas changé depuis les années 70",
    main_genre_id: rock.id
  }
]

YOUTUBE_ID = [
  'cWGE9Gi0bB0',
  'CduA0TULnow',
  'B0jMPI_pUec',
  's3Q80mk7bxE',
  'SXQe68dOc-Q',
  'cWGE9Gi0bB0',
  'EzURpTF5c8',
  'BUCTrcSGvsU',
  'rsWmrGuuWuE',
  'lS-af9Q-zvQ',
  'BGBM5vWiBLo',
  'bESGLojNYSo'
]

puts '-------------------------------------------------------------------------'
puts "CREATING #{opinions.size} OPINIONS AND #{TRACKS_BY_OPINION_MIN} TO #{TRACKS_BY_OPINION_MAX} TRACKS BY OPINION AND #{VOTES_BY_TRACK_MIN} TO #{VOTES_BY_TRACK_MAX} VOTES BY TRACK"

opinions.size.times do |count|
  user = User.order('RANDOM()').first
  opinion = Opinion.create!(
    name: opinions[count][:name],
    description: Faker::Lorem.paragraph(8, true, 4),
    fake_author: Faker::FunnyName.two_word_name,
    fake_city: Faker::Address.city,
    creator_id: user.id,
    approved: rand(-1..1)
  )
  opinion.id < 10 ? space = ' ' : space = ''
  print "OPINION #{space}#{opinion.id} |"
  rand(TRACKS_BY_OPINION_MIN..TRACKS_BY_OPINION_MAX).times do
    user = User.order('RANDOM()').first
    genre = rand(1..6) > 1 ? Genre.find(opinions[count][:main_genre_id]) : Genre.order('RANDOM()').first
    track = Track.create!(
      name: Faker::Pokemon.move,
      artist: Faker::Music.band,
      artist_location: Faker::Address.city,
      album: Faker::Music.album,
      argument: Faker::Lorem.paragraph(2),
      photo: "http://www.mind-test.fr/wp-content/uploads/2018/08/openminder" << rand(100..200).to_s << ".jpg",
      audio_url: 'www.audio-' << rand(1..9).to_s << rand(1..9).to_s << '.com',
      youtube_id: YOUTUBE_ID.sample,
      creator_id: user.id,
      genre_id: genre.id,
      opinion_id: opinion.id,
      approved: rand(-1..1)
    )
    print " T "
    rand(VOTES_BY_TRACK_MIN..VOTES_BY_TRACK_MAX).times do
      user = User.order('RANDOM()').first
      vote = Vote.create!(
        user_id: user.id,
        track_id: track.id,
        status: ['up', 'down'].sample
      )
    print '.'
    end
  end
  puts ''
end

puts ''
puts '-------------------------------------------------------------------------'
puts 'SEED DONE'

puts "Users:    #{User.count}"
puts "Opinions: #{Opinion.count}"
puts "Tracks:   #{Track.count}"
puts "Votes:    #{Vote.count}"
