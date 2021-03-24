class PostImage < ApplicationRecord
  
  belongs_to :user
  belongs_to :sauna_facility
  attachment :image 
  
end
