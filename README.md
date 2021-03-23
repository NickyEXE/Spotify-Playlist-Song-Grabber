# Import all songs from a Spotify Playlist

This is a basic app to take in the ID of a Spotify Playlist and save all the songs to an Active Record table. As is, it's only a step to building a better app, but I found myself reusing a lot of this code and wanted to abstract it and put it up to GitHub.

This was originally used for a thing I was hacking together late at night, so there's some inconsistencies and things I still want to work on: Setting up a gemfile, making it a gem itself, sticking to one tool for making network requests, making the whole thing less messy, but I gotta keep this repo up somewher.

There are a couple of methods I just included in here and some old bits of commented out code that don't do anything, because this is largely a repository of reusable code for me.

# How to Use

## Setting up the gems

Really didn't mean for this to be reusable code, so all the gems are required directly in the environment/initialize.rb file. Feel free to gem install them if you don't have any. Bundler coming soon if I don't forget about this.

## Authorizing with Spotify's API.

This app requires a Spotify Client ID and Client Secret, which you can get here: https://developer.spotify.com/dashboard/

By default, it will try to look for an ENV["SPOTIFY_ID"] and an ENV["SPOTIFY_SECRET"]. If you're cloning down the files, create a .env file in your root directory with the following:
SPOTIFY_ID=[Your ID]
SPOTIFY_SECRET=[Your Secret]

Alternatively, in your workflow, you can call the `PlaylistAPI.authorize([Your ID], [Your Secret])` method before making any calls.

## Setting up SQLite

Running `rake db:migrate` will set up the song table if you have the SQLite gem installed.

Running `rake db:rollback` will get rid of the table.

## Using the App

To get all songs from a playlist, initialize a playlist with its spotify ID (you can copy it from the URI, or you'll probably be able to spot it in the URL for any link to a playlist), then call get_all_songs on it.

For example, to get 2400 grunge and alt rock songs from the 90s, call:

```ruby
PlaylistAPI.new("4fd3F2MdmGuYewrNTxaHDY").request_all_songs
```

### Customizing

Currently, it's only set up to save a Spotify ID, album name, the title of the song, and the first artist. A lot more information comes through in the API call. Feel free to modify the song table and the Song.initialize_by_track method to customize your own data.

It also currently doesn't save which playlist you're getting it from, so if you want to set this up to take in multiple different playlists and then to view them separately, I'm leaving that up as an exercise to the reader.
