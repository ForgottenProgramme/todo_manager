class User < ActiveRecord::Base
  validates :first_name, presence: true
  validates :email, presence: true
  has_secure_password
  has_many :todos

  def to_pleasant_string
    "User: #{name}, Email: #{email}"
  end
end
