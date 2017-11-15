class Dislike < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :micropost, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :micropost }

  after_create :destroy_like

  private

  def destroy_like
    like = Like.find_by user_id: self.user_id, micropost_id: self.micropost_id
    return if like.nil?
    like.destroy
  end
end
