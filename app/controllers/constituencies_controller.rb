class ConstituenciesController < ApplicationController
  before_action :set_constituency, only: [:show, :edit, :update, :destroy]

    # GET /constituencies
  # GET /constituencies.json
  def index
    @constituencies = Constituency.all
  end

  # GET /constituencies/1
  # GET /constituencies/1.json
  def show
  end

  # GET /constituencies/new
  def new
    @constituency = Constituency.new
    @constituency.votes.build
  end

  # GET /constituencies/1/edit
  def edit
    @constituency.votes.build
  end

  # POST /constituencies
  # POST /constituencies.json
  def create
    @constituency = Constituency.new(constituency_params)

    respond_to do |format|
      if @constituency.save
        format.html { redirect_to @constituency, notice: 'Constituency was successfully created.' }
        format.json { render :show, status: :created, location: @constituency }
      else
        format.html { render :new }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /constituencies/1
  # PATCH/PUT /constituencies/1.json
  def update
    respond_to do |format|
      if @constituency.update(constituency_params)
        format.html { redirect_to @constituency, notice: 'Constituency was successfully updated.' }
        format.json { render :show, status: :ok, location: @constituency }
      else
        format.html { render :edit }
        format.json { render json: @constituency.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /constituencies/1
  # DELETE /constituencies/1.json
  def destroy
    @constituency.destroy
    respond_to do |format|
      format.html { redirect_to constituencies_url, notice: 'Constituency was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  def count_all_votes(dupa)
    #@constituency = Constituency.find(id)
    @votes = Vote.where(constituency_id = dupa)
    quantity = 0
    if !@votes.nil?
      quantity = @votes.sum("quantity")
    end 
    #@votes.each do |vote|
      #quantity = quantity + vote.quantity
      #end
    #votes.sum(:quantity)
  end
  helper_method :count_all_votes
  
  private
    # Use callbacks to share common setup or constraints between actions.
    def set_constituency
      @constituency = Constituency.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def constituency_params
      params.require(:constituency).permit(:number, :name, :province_id, :canceled_votes_1, :canceled_votes_2, :canceled_votes_3, votes_attributes: [:id, :quantity, :constituency_id, :committee_id])
    end
end
