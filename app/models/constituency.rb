class Constituency < ActiveRecord::Base
  belongs_to :province
  has_many :votes
  belongs_to :user
  has_one :user

  validates :number, numericality:  {only_integer:true}
  validates :voters, numericality:  {only_integer:true}
  validates :canceled_votes_1, numericality:  {only_integer:true}
  validates :canceled_votes_2, numericality:  {only_integer:true}
  validates :canceled_votes_3, numericality:  {only_integer:true}
end
