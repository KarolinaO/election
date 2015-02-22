class VotesController < ApplicationController

  # GET /votes
  # GET /votes.json
  def index
    if current_user.role == 0
      @votes = Vote.where(constituency_id: current_user.constituency_id)
    else 
      @votes = Vote.order(:constituency_id).all
    end
  end

  # GET /votes/new
  def new

    @vote = Vote.new
    @id = current_user.constituency_id
    @flag = @vote.getVotesByConstituencyId(@id)
    @constituency = Constituency.find(@id)
    @constituency.votes.build
    @province_id = @constituency.province_id
    @commiettee = Committee.new
    @commieties = @commiettee.getCommitteesByProvinceId(@province_id)
  # GET /votes/1/edit
    end
  def edit
    @constituency.votes.build
  end
  
  def findCommitteeById(id)
    @committee = Committee.find(id)
    @committee.name
  end
  helper_method :findCommitteeById
  
  def findConstituencyById(id)
    @constituency = Constituency.find(id)
    @constituency.name
  end
  helper_method :findConstituencyById

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end




    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:quantity, :constituency_id, :committee_id)
    end
end
