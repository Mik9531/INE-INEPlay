class AddCoverImageAttachmentToGames < ActiveRecord::Migration[5.1]
  def up
    add_attachment :games, :cover_image
  end

  def down
    remove_attachment :games, :cover_image
  end
end
