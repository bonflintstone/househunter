class AddHouses < ActiveRecord::Migration[5.1]
  def change
    create_table :houses do |t|
      t.string :name
      t.string :address
      t.string :link
    end
  end
end
