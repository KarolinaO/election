class StatisticsController < InheritedResources::Base


  def index
    @provinces = Province.all
    @provinces.each do |province|
      @total_sum = 0
      @stat = array
      province.constituencies.each do |constituency|
        @sum = 0
        constituency.votes.each do |vote|
          @sum = @sum + vote.quantity
        end
        @total_sum = @total_sum + @sum
      end
    end
    end
  def statistic_params
      params.require(:statistic).permit(:province_ids => [], :constituency_ids => [], )
    end
end

