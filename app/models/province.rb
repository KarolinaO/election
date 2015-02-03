class Province < ActiveRecord::Base
has_many :constituencies
has_many :votes
has_many :committees

validates :name, length: {minimum: 8}
validates :seats, numericality:  {only_integer:true}
end
