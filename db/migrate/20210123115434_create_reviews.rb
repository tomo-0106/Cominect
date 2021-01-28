class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :rate
      t.text :body
      t.integer :user_id
      t.integer :comic_id

      t.timestamps
    end
  end
end
