class CreateGithubReports < ActiveRecord::Migration[5.0]
  def change
    create_table :github_reports do |t|
      t.references :agency, foreign_key: true
      t.integer :repos_public
      t.integer :total_stars
      t.integer :total_members
      t.json :languages

      t.timestamps
    end
  end
end
