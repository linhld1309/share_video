class AddVideoFileToVideos < ActiveRecord::Migration[6.1]
  def change
    add_column :videos, :videofile, :string 
  end
end
