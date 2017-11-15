class Like < ApplicationRecord
  belongs_to :user
  belongs_to :micropost
  validates :micropost, uniqueness: { scope: :user }
  validates :user, uniqueness: { scope: :micropost }

  after_create :destroy_dislike

scope :hot, -> {
  joins(:micropost).select(:micropost_id).group("likes.micropost_id").order("count(*) DESC").limit(5)
}

  private

  def destroy_dislike
    dislike = Dislike.find_by user_id: self.user_id, micropost_id: self.micropost_id
    return if dislike.nil?
    dislike.destroy
  end
end
