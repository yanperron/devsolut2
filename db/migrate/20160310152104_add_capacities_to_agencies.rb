class AddCapacitiesToAgencies < ActiveRecord::Migration[5.0]
  def change
    add_column :agencies, :does_web_development, :boolean, null: false, default: false
    add_column :agencies, :does_mobile_development, :boolean, null: false, default: false
  end
end
