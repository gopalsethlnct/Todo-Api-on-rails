class Role < ApplicationRecord
  has_many :users
  scopify
end
