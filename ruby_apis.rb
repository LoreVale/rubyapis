require "uri"
require "net/http"
require 'json'

api_key = '2ee4c5e7'
movies = [
  "Avengers: Endgame",
  "Avatar",
  "Titanic",
  "Star Wars: The Force Awakens",
  "Jurassic World",
  "The Lion King",
  "The Avengers",
  "Frozen II",
  "Furious 7",
  "Black Panther"
]

movie_title = movies.sample

# Definimos la URL de la API.
url = URI("http://www.omdbapi.com/?apikey=#{api_key}&t=#{movie_title}")

# Realizamos la petición GET a la API.
https = Net::HTTP.new(url.host, url.port);
https.use_ssl = false
request = Net::HTTP::Get.new(url)

# Obtenemos la respuesta de la API.
response = https.request(request)
result = JSON.parse(response.read_body)

# Mostramos el resultado de la consulta.
puts result