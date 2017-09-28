class User < ApplicationRecord
  include BaseUser

  serialize :exchanges, Array
end
