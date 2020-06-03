class Artist

  attr_reader :name, :years_experience
  @@all = []

  def initialize(name, years_experience)
    @name = name
    @years_experience = years_experience
    @@all << self
  end

  def self.all
    @@all 
  end 

  def paintings
    Painting.all.select {|painting| painting.artist == self}
  end 

  def galleries 
    paintings.map {|painting| painting.gallery}
  end 

  def cities 
    galleries.map {|gallery| gallery.city}
  end 

  def self.total_experience
    all.collect{|artist| artist.years_experience}.sum
  end 

  def self.hash
    artist_rate = {}
    all.each do |artist|
      artist_rate[artist] = artist.paintings.size / artist.years_experience.to_f
    end 
    artist_rate
  end 

  def self.most_prolific
    hash.max_by {|artist, experience| experience} 
  end 

  def create_painting(title, price, gallery)
    Painting.new(title, price, gallery, self)
  end 


end
