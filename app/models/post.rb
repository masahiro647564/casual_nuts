class Post < ApplicationRecord
  has_one_attached :image
  attribute :new_image

  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 1000 }

  before_save do
    self.image = new_image if new_image
  end
end
