class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def note_contents=(contents)
    contents.each do |c| 
      note = Note.create(content: c)
      self.notes << note
    end 
  end 

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end 

  def artist_name
    self.artist ? self.artist.name : nil 
  end 


end
