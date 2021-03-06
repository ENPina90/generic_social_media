class Profile < ApplicationRecord
  belongs_to :user
  has_many_attached :photos, dependent: :purge
  has_many :posts, dependent: :destroy
  has_many :comments, dependent: :destroy
  has_and_belongs_to_many :friends,
    class_name: "Profile",
    join_table: :friends_profiles,
    foreign_key: :profile_id,
    association_foreign_key: :friend_id
end
