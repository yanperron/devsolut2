class LinkedinReport < ApplicationRecord
  belongs_to :agency


  def specialities_array
    self.specialities.split(",")
  end


end
