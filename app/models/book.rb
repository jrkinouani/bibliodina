class Book < ApplicationRecord
  belongs_to :user

  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {maximum: 75}
  validates :author, presence: true
  validates :summery, presence: true , length: {maximum: 500}

end
