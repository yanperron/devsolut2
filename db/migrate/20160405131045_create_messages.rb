class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, foreign_key: true
      t.text :content
      t.boolean :read

      t.timestamps
    end
  end
end
