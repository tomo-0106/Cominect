class CreateComics < ActiveRecord::Migration[5.2]
  def change
    create_table :comics do |t|
      t.integer :genre_id
      t.string :image_id
      t.string :title
      t.text :body
      t.string :author
      t.string :publisher
      t.boolean :is_active

      t.timestamps
    end
  end
end
