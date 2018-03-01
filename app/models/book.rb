class Book < ApplicationRecord
  belongs_to :user
  belongs_to :genre
  has_many :reservations ,dependent: :destroy
  has_many :reviews  ,dependent: :destroy

  def self.search(search)
     where("title LIKE ?", "%#{search}%")

  end

  mount_uploader :image, ImageUploader
  validates :title, presence: true, length: {maximum: 30}
  validates :author, presence: true
  validates :summery, presence: true , length: {maximum: 500}

  def average_rating
    reviews.count == 0 ? 0 : reviews.average(:star).round(2)
  end

end
