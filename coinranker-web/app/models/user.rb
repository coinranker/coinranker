class User < ApplicationRecord
  include BaseUser

  serialize :exchanges, Array
  has_secure_password


end
