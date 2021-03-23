class Song

    attr_reader :album, :id, :name, :artist

    @@all = []

    def initialize(track)
        @album = track["album"]["name"]
        @id = track["id"]
        @name = track["name"]
        @artist = track["artists"].first["name"]
        @@all << self
    end

    def self.all
        @@all
    end

    def clean_title
        cleaned_title = self.name.upcase
        puts cleaned_title
        # Removes anything in a parenthesis, ie. "(Remaster)"
        cleaned_title.index("(") && cleaned_title.slice!(cleaned_title.index("("), cleaned_title.index(")")+1)
        # Removes anything after a dash, such as "- Studio Version"
        cleaned_title = cleaned_title.index("-") ? cleaned_title.slice(0,cleaned_title.index("-")-1) : cleaned_title
        # Removes any "THE" in front of a song title
        cleaned_title = cleaned_title.index("THE ") ? cleaned_title.split("THE ").join("") : cleaned_title
        cleaned_title
    end

    def search_name
        "#{clean_title} - #{artist}"
    end

end