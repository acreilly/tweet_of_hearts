class User < ActiveRecord::Base
  has_many :tweets

  validates :email, :first_name, :password, presence: true
  validates :email, uniqueness: true
  validates :email, format: { with: /\A[^@]+@([^@\.]+\.)+[^@\.]+\z/,
                              message: "only allow valid email addresses"}


  has_many :relationships
  has_many :followers, through: :relationships

  has_many :followee_relationships, :foreign_key => "follower_id", :class_name => "Relationship"
  has_many :followings, through: :followee_relationships, source: :user

  include BCrypt

  def password
    @password ||= Password.new(password_hash)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_hash = @password
  end
end
