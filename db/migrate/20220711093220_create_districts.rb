class CreateDistricts < ActiveRecord::Migration[6.1]
  def change
    create_table :districts do |t|
      t.string :code
      t.string :name
      t.belongs_to :region
      t.timestamps
    end
  end
end
