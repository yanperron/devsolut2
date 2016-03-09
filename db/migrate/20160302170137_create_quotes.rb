class CreateQuotes < ActiveRecord::Migration[5.0]
  def change
    create_table :quotes do |t|
      t.text :titre
      t.text :description
      t.string :pdf
      t.references :user, foreign_key: true
      t.references :agency, foreign_key: true

      t.timestamps
    end
  end
end
