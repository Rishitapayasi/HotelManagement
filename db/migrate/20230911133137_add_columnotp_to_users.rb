class AddColumnotpToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :otp, :integer
  end
end
