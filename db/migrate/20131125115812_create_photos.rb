class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.belongs_to :user, index: true
      t.string :caption
      t.string :tags
      t.string :URL

      t.timestamps
    end
  end
end
