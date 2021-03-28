class SaunaFacility < ApplicationRecord

  attachment :image
  geocoded_by :address
  after_validation :geocode, if: :address_changed?
  has_many :reviews, dependent: :destroy
  has_many :post_images, dependent: :destroy

  def self.search(search)
    if search
      where(['name LIKE ?', "%#{search}%"])
    else
      all
    end
  end

end
