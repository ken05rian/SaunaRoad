class AddMapInfoToSaunaFacilities < ActiveRecord::Migration[5.2]
  def change
    add_column :sauna_facilities, :latitude, :float
    add_column :sauna_facilities, :longitude, :float
  end
end
