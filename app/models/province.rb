class Province < ActiveRecord::Base
has_many :constituencies
has_many :votes
has_many :committees
has_one :user

validates :name, length: {minimum: 8}
validates :seats, numericality:  {only_integer:true}
end
