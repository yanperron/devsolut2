class AddAgencyToWishlists < ActiveRecord::Migration[5.0]
  def change
    add_reference :wishlists, :agency, foreign_key: true
  end
end
