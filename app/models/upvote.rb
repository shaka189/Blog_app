class Upvote < ApplicationRecord
  belongs_to :micropost
  belongs_to :user

  validates :micropost, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :micropost }
end
