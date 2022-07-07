class CreateUrls < ActiveRecord::Migration[6.1]
  def change
    create_table :urls do |t|
      t.string :description
      t.text :long_url
      t.string :short_url
      t.integer :count
      t.belongs_to :user
      t.timestamps
    end
  end
end
