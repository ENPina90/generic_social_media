class AddOrientationToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :orientation, :string
  end
end
