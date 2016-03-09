class AddDataToAgencies < ActiveRecord::Migration[5.0]

  def change
    add_column :agencies, :repos_public, :integer
    add_column :agencies, :total_stars, :integer
    add_column :agencies, :total_members, :integer
  end

end
