class RenamePostCommentsToComicComment < ActiveRecord::Migration[5.2]
  def change
    rename_table :post_comments, :comic_comments
  end
end
