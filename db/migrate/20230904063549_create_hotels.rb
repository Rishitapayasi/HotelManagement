class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.integer :status 
      t.references :user, foreign_key: "owner_id"

      t.timestamps
    end
  end
end
