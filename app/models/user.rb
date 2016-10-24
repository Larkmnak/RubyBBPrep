class User < ApplicationRecord
  has_many :ideas
  has_many :likes, dependent: :destroy
  has_secure_password
  email_regex = /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]+)\z/i
  validates :name, :email, presence: true
  validates :email, format: { :with => email_regex }
  validates_uniqueness_of :email, case_sensitive: false
  validates :password, length: { minimum: 8 }, allow_nil: true, on: [:update]
end
