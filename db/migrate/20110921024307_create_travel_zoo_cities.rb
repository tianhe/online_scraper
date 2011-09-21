class CreateTravelZooCities < ActiveRecord::Migration
  def change
    create_table :travel_zoo_cities do |t|
      t.string :name

      t.timestamps
    end
  end
end
