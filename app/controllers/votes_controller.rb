class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :edit, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    user_voted = has_user_already_voted()

    unless user_voted == true

    params[:name].blank? ? "" : selection = adjust_name()

    unless selection.blank?

    new_user_vote = User.create(uid: params[:uid], date: DateTime.now.to_date)
    found_existing = Vote.find_by(name: selection, date: DateTime.now.to_date)

    if found_existing.blank? || found_existing.nil?
      vote = Vote.create(name: selection, vote: 1, date: DateTime.now.to_date)
    else
      found_existing.vote = found_existing.vote + 1
      found_existing.save
    end
    end
  end
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  def get_votes
    @votes = Vote.all
  end

  # GET /votes/new
  def new
    @vote = Vote.new
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: 'Vote was successfully created.' }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: 'Vote was successfully updated.' }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: 'Vote was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def has_user_already_voted
      if params[:uid].blank?
        return true
      else
        found_user = User.find_by(uid: params[:uid], date: DateTime.now.to_date)
      end
      if found_user.nil? || found_user.blank?
        return false
      else
        return true
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.require(:vote).permit(:name, :vote, :date)
    end

    def adjust_name
      new_name = params[:name].downcase
      new_name = new_name.strip
      new_name = new_name.gsub(/\s+/, "")
    end
end
