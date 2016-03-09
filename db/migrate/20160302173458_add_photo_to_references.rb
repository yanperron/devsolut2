class AddPhotoToReferences < ActiveRecord::Migration[5.0]
  def change
    add_column :references, :photo, :string
  end
end
