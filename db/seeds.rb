require 'json'
require 'open-uri'

url = 'http://tmdb.lewagon.com/movie/top_rated'
movie_serialized = URI.open(url).read
movies = JSON.parse(movie_serialized)

movies['results'].each do |movie|
  Movie.create!(
    title: movie['title'],
    overview: movie['overview'],
    poster_url: movie["https://image.tmdb.org/t/p/w500#{movie['poster_path'}"],
    rating: movie['vote_average']
  )
end
