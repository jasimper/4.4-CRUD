class Album < ActiveRecord::Base
  validates :title, :genre, :artist, :length, presence: true
  validates :length, numericality: { greater_than: 0 }
  validates :length, length: { in: 1..3 }
  validates :title, uniqueness: { scope: :artist, message: "error. This artist/title combo already exist."}
end
