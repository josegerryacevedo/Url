class CreateCityMunicipalities < ActiveRecord::Migration[6.1]
  def change
    create_table :city_municipalities do |t|
      t.string :code
      t.string :name
      t.boolean :is_capital
      t.boolean :is_city
      t.boolean :is_municipality
      t.belongs_to :district
      t.belongs_to :province
      t.timestamps
    end
  end
end
