class Province < ActiveRecord::Base
has_many :constituencies
has_many :votes
has_one :user
has_and_belongs_to_many :committees

validates :name, length: {minimum: 7}
validates :seats, numericality:  {only_integer:true}
end

