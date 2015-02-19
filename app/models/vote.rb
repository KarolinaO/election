class Vote < ActiveRecord::Base
belongs_to :committee
belongs_to :constituency
belongs_to :province
has_one :canceled

#validate :less_votes_than_voters

after_save :remove_bad_votes

    def getVotesByConstituencyId(constituency_id)
      Votes.where("constituency_id=?", constituency_id)

    end
    
    def less_votes_than_voters
      @id = self.constituency_id
      max_votes = Constituency.find_by_id(@id).voters
      given_votes = self.quantity + constituency.canceled_votes_1 + constituency.canceled_votes_2 + constituency.canceled_votes_3
      if given_votes > max_votes
        errors.add(:constituency, t("constituency_form.more_votes_than_voters"))
      end
    end
    
    def remove_bad_votes
      @id = self.constituency_id
      max_votes = Constituency.find_by_id(@id).voters
      all_votes = count_all_votes(@id)
      if all_votes > max_votes
        @votes = Vote.where(constituency_id: @id)
        @votes.destroy_all
        @constituency = Constituency.find_by_id(@id)
        @constituency.update_attributes(:canceled_votes_1 => '0')
        @constituency.update_attributes(:canceled_votes_2 => '0')                
        @constituency.update_attributes(:canceled_votes_3 => '0')
      end
    end
    
    def count_good_votes(d)
      @votes = Vote.where(constituency_id: d)
      good_votes = 0
      if !@votes.nil?
        good_votes = @votes.sum("quantity")
      end 
    end
  
    def count_bad_votes(d)
      @constituency = Constituency.find_by_id(d)
      bad_votes = 0
      if !@constituency.nil?
        bad_votes = @constituency.canceled_votes_1 + @constituency.canceled_votes_2 + @constituency.canceled_votes_3
      end
    end
  
    def count_all_votes(d)
      good_votes = count_good_votes(d)
      bad_votes = count_bad_votes(d)
      all_votes = good_votes + bad_votes
    end

end
