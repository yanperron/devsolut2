class AddUserRefToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_reference :agencies, :user, foreign_key: true
  end
end
