class User < ApplicationRecord
  has_many :agencies, dependent: :destroy
  has_many :reviews
  mount_uploader :photo, PhotoUploader


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable


  def full_name
    "#{first_name.try(:capitalize)} #{last_name.try(:capitalize)} "
  end

end
