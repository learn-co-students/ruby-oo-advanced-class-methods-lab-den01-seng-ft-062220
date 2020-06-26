require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize()end


  def save
    self.class.all << self
  end

  def self.all
    @@all
  end

  def self.create
    song = new
    song.save
    song
  end

  def self.new_by_name(name)
    song = new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find do |song|
      song.name == name
    end
  end

  def self.find_or_create_by_name(name)
    return find_by_name(name) if find_by_name(name)

    create_by_name(name)
  end

  def self.alphabetical
    @@all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename = parse_filename(filename)
    song = new_by_name(filename.last)
    song.artist_name = filename.first
    song
  end

  def self.create_from_filename(filename)
    song = create_by_name(parse_filename(filename).last)
    song.artist_name = parse_filename(filename).first
    song
  end

  def self.destroy_all
    @@all.clear
  end


  def self.parse_filename(filename)
    artist_name = filename.split(' - ').first
    name = filename.split(' - ').last.split('.').first
    [artist_name, name]
  end

end
