class Constituency < ActiveRecord::Base
  belongs_to :province
  has_many :votes
  belongs_to :user
  has_one :user
  before_validation :default_values
  accepts_nested_attributes_for :votes
  
 
  validates :voters, numericality:  {only_integer:true}
  validates :canceled_votes_1, numericality:  {only_integer:true}
  validates :canceled_votes_2, numericality:  {only_integer:true}
  validates :canceled_votes_3, numericality:  {only_integer:true}
  
  def default_values
     self.voters ||= 0
     self.canceled_votes_1 ||= 0
     self.canceled_votes_2 ||= 0
     self.canceled_votes_3 ||= 0
   end
end
