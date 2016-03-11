class AddEmailToQuotes < ActiveRecord::Migration[5.0]
  def change
    add_column :quotes, :email, :string
    remove_reference :quotes, :user, index: true
  end
end
