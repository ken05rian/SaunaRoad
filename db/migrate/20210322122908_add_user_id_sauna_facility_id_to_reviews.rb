class AddUserIdSaunaFacilityIdToReviews < ActiveRecord::Migration[5.2]
  def change
    add_column :reviews, :user_id, :integer
    add_column :reviews, :sauna_facility_id, :integer
  end
end
