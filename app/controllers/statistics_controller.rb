class StatisticsController < InheritedResources::Base

  private
  def index
  @provinces = Province.all
  @provinces.each do |province|
    @constituencies = Constituency.where(province_id: province.id)
  end
 @constituencies.each do |constituency|
 @votes = Vote.where(constituency.id, constituency.id)

    def statistic_params
      params.require(:statistic).permit(:province_ids => [], :constituency_ids => [], )
    end
end

  end
  end