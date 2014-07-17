class User < ActiveRecord::Base
  has_many :tweets
  validates :email, :first_name, :password, presence: true
  validates :email, uniqueness: true
end
