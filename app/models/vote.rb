class Vote < ActiveRecord::Base
belongs_to :committee
belongs_to :constituency
belongs_to :province
has_one :canceled


def vote_status
  [
      ['Poprawny'],
      ['Anulowany']

  ]
  end
end
