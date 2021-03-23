require 'pry'
require 'dotenv'
require 'base64'
require 'rest-client'
require 'json'
require_relative 'models/song.rb'
require_relative 'models/playlist_api.rb'
Dotenv.load

# client_id = ENV["CLIENT_ID"]
# client_secret = ENV["CLIENT_SECRET"]

# client_token = Base64.strict_encode64(client_id + ":" + client_secret)
# spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
# parsed_token = JSON.parse(spotify_token)


# i = 0

PlaylistAPI.new("4fd3F2MdmGuYewrNTxaHDY").request_all_songs

binding.pry