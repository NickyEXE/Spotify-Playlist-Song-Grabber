task :environment do
  require_relative './environment/initialize.rb'
end 

task :console => :environment do
	binding.pry
end

namespace :db do
  desc 'sets up song table'
  task :migrate => :environment do
    CreateSongTable.migrate(:up)
  end
  
  desc 'reverses song table'
  task :rollback => :environment do
    CreateSongTable.migrate(:down)
  end

	namespace :seed do
		task :grunge_songs => :environment do
			PlaylistAPI.new("4fd3F2MdmGuYewrNTxaHDY").request_all_songs
		end
	end

end