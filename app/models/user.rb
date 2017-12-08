class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  mount_uploader :avatar, AvatarUploader
  validates :full_name, presence: true, length: {maximum: 65}

  has_many :books 
  has_many :reservations
  has_many :reviews

end
