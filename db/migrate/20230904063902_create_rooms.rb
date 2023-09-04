class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.integer :room_no
      t.integer :room_price

      t.timestamps
    end
  end
end
