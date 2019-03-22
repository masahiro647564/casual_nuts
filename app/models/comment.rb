class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :user
  enum evaluations: { one: 1, two: 2, three: 3, four: 4, five: 5 , six: 6}

  validates :evaluation, presence: true
  validates :title, presence: true, length: { maximum: 50 }
  validates  :body,  presence: true, length: { maximum: 300 }
  validates_uniqueness_of :post_id, scope: :user_id
end
