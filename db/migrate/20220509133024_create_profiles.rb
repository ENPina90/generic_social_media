class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :name
      t.string :address
      t.text :bio
      t.date :birthday
      t.string :sex
      t.string :orientation

      t.timestamps
    end
  end
end
