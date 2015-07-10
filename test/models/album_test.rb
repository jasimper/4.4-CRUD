require 'test_helper'

class AlbumTest < ActiveSupport::TestCase

  test "create album works" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', artist: 'Test Artist', length: 1)
    assert a.valid?
  end

  test "save album works" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', artist: 'Test Artist', length: 1)
    a.save
    assert Album.exists?(a.id)
  end

  test "title must be present" do
    a = Album.new(genre: 'Test Genre', artist: 'Test Artist', length: 1)
    refute a.valid?
    assert a.errors.keys.include?(:title)
  end

  test "artist must be present" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', length: 1)
    refute a.valid?
    assert a.errors.keys.include?(:artist)
  end

  test "genre must be present" do
    a = Album.new(title: 'Test Title', artist: 'Test Artist', length: 1)
    refute a.valid?
    assert a.errors.keys.include?(:genre)
  end

  test "length must be present" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', artist: 'Test Artist')
    refute a.valid?
    assert a.errors.keys.include?(:length)
  end

  test "title length must be greater than 0" do
    a = Album.new(title: '', genre: 'Test Genre', artist: 'Test Artist', length: 1)
    refute a.valid?
    assert a.errors.keys.include?(:title)
  end

  test "artist length must be greater than 0" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', artist: '', length: 1)
    refute a.valid?
    assert a.errors.keys.include?(:artist)
  end

  test "genre length must be greater than 0" do
    a = Album.new(title: 'Test Title', genre: '', artist: 'Test Artist', length: 1)
    refute a.valid?
    assert a.errors.keys.include?(:genre)
  end

  test "length length must be greater than 0" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', artist: 'Test Artist', length: 0)
    refute a.valid?
    assert a.errors.keys.include?(:length)
  end

  test "no duplicates of artist and song combo" do
    a = Album.new(title: 'Test Title', genre: 'Test Genre', artist: 'Test Artist', length: 10)
    a.save
    b = Album.new(title: 'Test Title', genre: 'Test_Genre', artist: 'Test Artist', length: 30)
    refute b.valid?
  end

end
