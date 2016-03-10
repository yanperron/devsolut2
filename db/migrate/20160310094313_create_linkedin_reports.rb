class CreateLinkedinReports < ActiveRecord::Migration[5.0]
  def change
    create_table :linkedin_reports do |t|
      t.references :agency, foreign_key: true
      t.string :size
      t.string :specialities
      t.string :industry
      t.string :address
      t.string :create_date
      t.string :website

      t.timestamps
    end
  end
end
