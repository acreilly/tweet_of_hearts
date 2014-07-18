class User < ActiveRecord::Base
  has_many :tweets
  validates :email, :first_name, :password, presence: true
  validates :email, uniqueness: true

  has_many :relationships
  has_many :followers, through: :relationships

  has_many :followee_relationships, :foreign_key => "follower_id", :class_name => "Relationship"
  has_many :followings, through: :followee_relationships, source: :user
end
