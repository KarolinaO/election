class Committee < ActiveRecord::Base
  has_and_belongs_to_many :provinces
  has_many :votes
  belongs_to :user

  validates :name, length: {minimum: 5}
  validates :logo, length: {minimum: 20}

end