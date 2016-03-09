class CreateReferences < ActiveRecord::Migration[5.0]
  def change
    create_table :references do |t|
      t.string :name
      t.text :description
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
