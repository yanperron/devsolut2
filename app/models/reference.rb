class Reference < ApplicationRecord
  belongs_to :agency
  mount_uploader :photo, PhotoUploader

end
