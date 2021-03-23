class PlaylistAPI

    attr_reader :parsed_token, :playlist_id
    attr_accessor :offset

    def initialize(playlist_id)        
        client_id = ENV["CLIENT_ID"]
        client_secret = ENV["CLIENT_SECRET"]
        client_token = Base64.strict_encode64(client_id + ":" + client_secret)
        spotify_token = RestClient.post("https://accounts.spotify.com/api/token",{"grant_type": "client_credentials"}, {"Authorization": "Basic #{client_token}"})
        @parsed_token = JSON.parse(spotify_token)
        @playlist_id = playlist_id
        @offset = 0
    end

    def request_songs
        response = JSON.parse(`curl -X GET "https://api.spotify.com/v1/playlists/#{playlist_id}/tracks?offset=#{offset}&limit=100" -H "Authorization: Bearer #{parsed_token["access_token"]}"`)
        response["items"].each{|track| Song.new(track["track"])}
    end

    def request_all_songs
        songs = request_songs
        while songs.size > 0
            @offset += 100
            songs = request_songs
        end
    end

end