class AddLinkedinToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :linkedin_account, :string
  end
end
