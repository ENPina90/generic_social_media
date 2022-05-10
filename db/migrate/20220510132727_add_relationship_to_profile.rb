class AddRelationshipToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :relationship, :string
  end
end
