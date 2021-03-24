class AddSaunaFacilityIdToPostImages < ActiveRecord::Migration[5.2]
  def change
    add_column :post_images, :sauna_facility_id, :integer
  end
end
