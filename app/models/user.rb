class User < ApplicationRecord

    mount_uploader :photo, PhotoUploader

  has_many :agencies, dependent: :destroy
  has_many :reviews, dependent: :destroy
  has_many :quotes, dependent: :destroy
  belongs_to :wishlist, dependent: :destroy
  has_many :messages, dependent: :destroy



  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def full_name
    "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)} "
  end

end
