class PlaylistAPI

  attr_reader :parsed_token, :playlist_id
  attr_accessor :offset

  @@client_id ||= ENV["SPOTIFY_ID"]
  @@client_secret ||= ENV["SPOTIFY_SECRET"]

  def initialize(playlist_id)    
    @playlist_id = playlist_id
    @offset = 0
  end

  def self.authorize(client_id, client_secret)
    @@client_id = client_id
    @@client_secret = client_secret
  end

  def get_token
    client_token = Base64.strict_encode64(@@client_id + ":" + @@client_secret)
    spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
    @parsed_token = JSON.parse(spotify_token)
  end

  def request_songs
    response = JSON.parse(`curl -X GET "https://api.spotify.com/v1/playlists/#{playlist_id}/tracks?offset=#{offset}&limit=100" -H "Authorization: Bearer #{parsed_token["access_token"]}"`)
    response["items"].each{|track| Song.initialize_by_track(track["track"])}
  end

  def request_all_songs
    get_token
    songs = request_songs
    while songs.size > 0
      @offset += 100
      songs = request_songs
    end
  end

end