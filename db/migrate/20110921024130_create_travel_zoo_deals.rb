class CreateTravelZooDeals < ActiveRecord::Migration
  def change
    create_table :travel_zoo_deals do |t|
      t.string :url
      t.boolean :expired
      t.integer :quantity_sold
      t.integer :offer_price
      t.integer :full_price
      t.boolean :limit_reached
      t.date :expiration_date
      t.date :effective_date

      t.timestamps
    end
  end
end
