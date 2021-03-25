class PostImage < ApplicationRecord

  belongs_to :user
  belongs_to :sauna_facility
  has_many :post_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  def favorited_by?(user)
    if !user.nil? then
      favorites.where(user_id: user.id).exists?
    end
  end

  attachment :image
  validates :image, presence: true

end
