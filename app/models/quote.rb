class Quote < ApplicationRecord
  belongs_to :agency
    mount_uploader :pdf, PhotoUploader

end
