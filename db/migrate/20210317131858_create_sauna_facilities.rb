class CreateSaunaFacilities < ActiveRecord::Migration[5.2]
  def change
    create_table :sauna_facilities do |t|
      t.string :name
      t.string :image_id
      t.string :address
      t.string :telephone_number
      t.string :regular_holiday
      t.string :access
      t.string :business_hour

      t.timestamps
    end
  end
end
