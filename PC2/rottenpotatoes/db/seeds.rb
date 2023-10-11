# Seed the RottenPotatoes DB with some movies.
more_movies = [
  { title: 'Ganibal', rating: 'G', release_date: '1992-11-25' },
  { title: 'Fuerza bruta', rating: 'R', release_date: '1989-07-21' },
  { title: 'The Ring', rating: 'PG-13', release_date: '2011-08-10' },
  { title: 'Alien: The Return', rating: 'PG', release_date: '1981-06-12' }
]

more_movies.each do |movie|
  Movie.find_or_create_by(title: movie[:title]) do |m|
    m.rating = movie[:rating]
    m.release_date = movie[:release_date]
  end
end
