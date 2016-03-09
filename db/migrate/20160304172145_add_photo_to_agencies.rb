class AddPhotoToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :photo, :string
  end
end
