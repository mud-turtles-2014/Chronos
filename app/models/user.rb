class User < ActiveRecord::Base
  has_many :capsules
  has_secure_password

end
