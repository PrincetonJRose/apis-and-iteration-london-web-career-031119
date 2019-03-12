require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character_name)
  #make the web request
  response_string = RestClient.get('http://www.swapi.co/api/people/')
  response_hash = JSON.parse(response_string)
  response_films = RestClient.get('http://www.swapi.co/api/films/')
  films_hash = JSON.parse(response_films)
  # iterate over the response hash to find the collection of `films` for the given
  #   `character`
  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `print_movies`
  #  and that method will do some nice presentation stuff like puts out a list
  #  of movies by title. Have a play around with the puts with other info about a given film.
  films_in = {}
  response_hash['results'].each do |result|
    if result['name'].downcase == character_name
      for number in 0...result['films'].size
        film_page = result['films'][number]
        get_title = RestClient.get(film_page)
        get_title = JSON.parse(get_title)
        title = get_title['title']
        films_in[result['films'][number]] = title
      end
    end
  end
  return films_in
end

def print_movies(films)
  # some iteration magic and puts out the movies in a nice list
  # films_in.each do |film|
  # puts film['title']
  films.each do |film, title|
    puts "\nMovies this character is in:\n"
    puts title
  end
end

def show_character_movies(character)
  films = get_character_movies_from_api(character)
  print_movies(films)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
