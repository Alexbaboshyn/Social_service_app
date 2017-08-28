class CreatePlaces < ActiveRecord::Migration[5.0]
  def change
    create_table :places do |t|
      t.float :latitude
      t.float :longitude
      t.string :name
      t.string :place_id
      t.string :tags, array: true, default: []
      t.string :name
      t.string :city
      t.float :overall_rating

      t.timestamps
    end
  end
end
