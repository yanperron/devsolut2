class AddGitToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :github_account, :string
  end
end
