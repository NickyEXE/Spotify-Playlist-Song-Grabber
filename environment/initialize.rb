# require 'pry'
# require 'dotenv'
# require 'base64'
# require 'rest-client'
# require 'json'
require 'active_record'
require 'bundler'
Bundler.require
Dotenv.load

require_relative '../models/song.rb'
require_relative '../models/playlist_api.rb'
require_relative './migrations/create_song_table.rb'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: 'test.db'
)
