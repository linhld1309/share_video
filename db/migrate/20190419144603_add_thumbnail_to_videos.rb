class AddThumbnailToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :thumbnail, :string 
  end
end
