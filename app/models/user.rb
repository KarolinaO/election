class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, 
         :recoverable, :rememberable, :trackable, :validatable
#has_and_belongs_to :constituencies
has_many :committees

validates :name, length: { minimum: 2}
validates :surname, length: { minimum: 2 }
validates :password, length: { in: 6..20 }
#validates :type, numeralicity: {only_integer: true}
validates :city, length: { minimum: 3}
end
