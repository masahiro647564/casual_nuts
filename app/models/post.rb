class Post < ApplicationRecord
  belongs_to :nut
  belongs_to :genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :users, through: :comments
  has_many :likes, dependent: :destroy
  has_one_attached :image
  attribute :new_image

  validates :title, presence: true, length: { maximum: 50 }
  validates :nut, presence: true
  validates :description, presence: true, length: { maximum: 1000 }

  scope :find_newest_posts, -> (p) { page(p).per(4).order(created_at: :desc) }


  before_save do
    self.image = new_image if new_image
  end

  def like_user(user_id)
    likes.find_by(user_id: user_id)
  end
end
