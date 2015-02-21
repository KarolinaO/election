class CommitteesProvinces < ActiveRecord::Base
  belongs_to :committees
  belongs_to :provinces
end