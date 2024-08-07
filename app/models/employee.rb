class Employee < ApplicationRecord
  validates :email, presence: true, uniqueness: true
end
