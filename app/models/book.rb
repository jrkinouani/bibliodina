class Book < ApplicationRecord
  belongs_to :user
  belongs_to :category
  has_many :reservations

  def self.search(search)
     where("title LIKE ?", "%#{search}%")
     where("author LIKE ?", "%#{search}%")
  end

  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {maximum: 75}
  validates :author, presence: true
  validates :summery, presence: true , length: {maximum: 500}

end
