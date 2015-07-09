class CreateAlbums < ActiveRecord::Migration
  def change
    create_table :albums do |t|
      t.string  :title
      t.string  :artist
      t.string  :genre
      t.integer :length

      t.timestamps null: false
    end
  end
end
