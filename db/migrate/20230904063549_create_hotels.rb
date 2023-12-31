class CreateHotels < ActiveRecord::Migration[7.0]
  def change
    create_table :hotels do |t|
      t.string :name
      t.string :location
      t.integer :status
      t.references :user,  null: false, foreign_key: true

      t.timestamps
    end
  end
end
