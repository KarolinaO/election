class User < ActiveRecord::Base
has_many :committees
has_one :constituency
has_one :province

acts_as_authentic do |config|
  config.validate_login_field = false
  config.validate_password_field = false
  config.crypted_password_field = :crypted_password
  config.require_password_confirmation = true
end

validates :name, length: { minimum: 2}
validates :surname, length: { minimum: 2 }
validates :login, length: { minimum: 2 }, uniqueness: true

validates :city, length: { minimum: 3}
end
