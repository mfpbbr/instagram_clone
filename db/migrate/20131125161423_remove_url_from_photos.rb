class RemoveUrlFromPhotos < ActiveRecord::Migration
  def change
    remove_column :photos, :URL, :string
  end
end
