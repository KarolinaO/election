class Province < ActiveRecord::Base
has_many :constituencies
has_many :votes
has_and_belongs_to_many :committees

validates :province_name, length: {minimum: 8}
validates :seats, numericality{only_integer :true}
end
