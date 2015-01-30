class Constituency < ActiveRecord::Base
  belongs_to :province
  has_many :votes
  has_and_belongs_to :users

  validates :number, numeralicity {only_integer :true}
  validates :voters, numeralicity {only_integer :true}
  validates :canceled_votes_1, numeralicity {only_integer :true}
  validates :canceled_votes_2, numeralicity {only_integer :true}
  validates :canceled_votes_3, numeralicity {only_integer :true}
end
