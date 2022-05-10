class CreateFriendlyJoinTable < ActiveRecord::Migration[6.1]
  def change
    create_join_table :profiles, :friends do |t|
      t.index [:profile_id, :friend_id]
      t.index [:friend_id, :profile_id]
    end
  end
end
