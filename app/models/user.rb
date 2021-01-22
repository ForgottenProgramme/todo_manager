class User < ActiveRecord::Base
  def to_pleasant_string
    "User: #{name}, Email: #{email}"
  end
end
