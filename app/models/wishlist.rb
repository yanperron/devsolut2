class Wishlist < ApplicationRecord

belongs_to :user
has_many :agencies

end
