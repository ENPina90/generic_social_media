class AddScoreToProfile < ActiveRecord::Migration[6.1]
  def change
    add_column :profiles, :score, :integer
  end
end
