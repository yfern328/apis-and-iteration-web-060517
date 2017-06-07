require 'rest-client'
require 'json'
require 'pry'

def get_character_movies_from_api(character)
  #make the web request
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)
  # binding.pry

  # iterate over the character hash to find the collection of `films` for the given
  #   `character`

  film_urls = character_hash["results"].each_with_object([]) do |character_trait_hash, film_url|
    if character_trait_hash["name"] == character
      film_url << character_trait_hash["films"]
    end
  end.flatten

  # collect those film API urls, make a web request to each URL to get the info
  #  for that film
  # return value of this method should be collection of info about each film.
  #  i.e. an array of hashes in which each hash reps a given film
  # this collection will be the argument given to `parse_character_movies`
  #  and that method will do some nice presentation stuff: puts out a list
  #  of movies by title. play around with puts out other info about a given film.

  film_data = film_urls.each_with_object([]) do |url, film_info|
    film_info << JSON.parse(RestClient.get(url))
  end

end

#DO THIS LATER FOR PROVIDING LIST OF CHARACTERS FOR USER
# def get_all_characters
#   character_hash
# end

def parse_character_movies(films_array)
  # some iteration magic and puts out the movies in a nice list
  # film_titles = []
  # films_array.each do |film_dat|
  #   film_titles = film_dat.each_with_object([]) do |(attribute, info), titles|
  #       #if attribute == "title"
  #         titles << film_dat["title"]
  #     end
  # end

  films_array.each do |hash|
    hash.each do |attribute, information|
      puts "#{attribute.capitalize} : #{information}"
      puts "\n"
    end
    puts "~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~"
  end
  #film_titles

end

def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
