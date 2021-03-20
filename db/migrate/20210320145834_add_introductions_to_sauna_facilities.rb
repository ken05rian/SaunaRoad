class AddIntroductionsToSaunaFacilities < ActiveRecord::Migration[5.2]
  def change
    add_column :sauna_facilities, :introduction, :text
  end
end
