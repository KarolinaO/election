class StatisticsController < InheritedResources::Base


  def index
    if(current_user.role == 1)
      @provinces = Province.all
      @provinces.each do |province|
      
        @total_sum = 0
        province.constituencies.each do |constituency|
          #@sum = 0
          #constituency.votes.each do |vote|
            #@sum = @sum + vote.quantity
            #end
          #@total_sum = @total_sum + @sum
          @total_sum = @total_sum + constituency.votes.sum("quantity")
        end
      
        @all_voters = province.constituencies.sum("voters")
      end
    end
  end
    
  def count_votes_by_constituency_id(d)
    @votes = Vote.where(constituency_id: d)
    quantity = 0
    if !@votes.nil?
      quantity = @votes.sum("quantity")
    end 
  end
  helper_method :count_votes_by_constituency_id
  
  def count_all_votes(committee_id, province_id)
    @constituencies = Constituency.where("province_id = ?", province_id)
    quantity = 0
      if !@constituencies.nil?
      @constituencies.each do |constituency|
        @votes = Vote.where("constituency_id = ? and committee_id = ?", constituency.id, committee_id)
        quantity = quantity + @votes.sum("quantity")
      end
    end
    quantity
  end
  helper_method :count_all_votes
  
  def count_percentage(votes, all_voters)
    percents = votes.to_f/all_voters.to_f
    percents = percents*100
    percents.round(2)
  end
  helper_method :count_percentage
  
  def statistic_params
    params.require(:statistic).permit(:province_ids => [], :constituency_ids => [], )
  end
end

