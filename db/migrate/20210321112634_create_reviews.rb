class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.float :score
      t.string :title
      t.text :caption

      t.timestamps
    end
  end
end
