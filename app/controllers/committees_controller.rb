class CommitteesController < ApplicationController
  before_action :set_committee, only: [:show, :edit, :update, :destroy]


  # GET /committee
  # GET /committee.json

  def index
    @committees = Committee.all
  end

  # GET /committees/1
  # GET /committees/1.json
  def show
  end
  else

  # GET /committees/new
  def new
    if(current_user.admin == 1)
    @committee = Committee.new
    end
    end

  # GET /committees/1/edit
  def edit
  end

  # POST /committee
  # POST /committee.json
  def create
    @committee = Committee.new(committee_params)

    respond_to do |format|
      if @committee.save
        format.html { redirect_to @committee, notice: 'Committee was successfully created.' }
        format.json { render :show, status: :created, location: @committee }
      else
        format.html { render :new }
        format.json { render json: @committee.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /committee/1
  # PATCH/PUT /committee/1.json
  def update
    if(current_user.admin == 1)
    respond_to do |format|
      if @committee.update(committee_params)
        format.html { redirect_to @committee, notice: 'Committee was successfully updated.' }
        format.json { render :show, status: :ok, location: @committee }
      else
        format.html { render :edit }
        format.json { render json: @committee.errors, status: :unprocessable_entity }
      end
    end
    end
    end

  # DELETE /committee/1
  # DELETE /committee/1.json
  def destroy
    if(current_user.admin == 1)
    @committee.destroy
    respond_to do |format|
      format.html { redirect_to committees_url, notice: 'Committee was successfully destroyed.' }
      format.json { head :no_content }
    end
    end
    end

  private
    # Use callbacks to share common setup or constraints between actions.

    def set_committee
      @committee = Committee.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def committee_params
      params.require(:committee).permit(:name, :avatar, :province_ids => [])
    end
    end
