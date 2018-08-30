class OpinionsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_opinion, only: [:show, :update, :destroy]

  def index
    # ---------------------------------------------------------
    # USER STORIES
    # - displaying opinions informations
    # - displaying random opinions
    # - creating a new opinion
    # ---------------------------------------------------------
    @opinions = policy_scope(Opinion).order(created_at: :desc)
    @opinion_new = Opinion.new
  end

  def show
    # ---------------------------------------------------------
    # before_action => set_opinion => @opinion
    # ---------------------------------------------------------
    # USER STORIES
    # - displaying opinion informations
    # - displaying tracks replying to the opinion
    # - displaying opinions related to the opinion
    # - creating a new track to reply to the opinion
    # - upvoting on a track
    # - downvoting on a track
    # ---------------------------------------------------------
    # ! if the opinion has just been created by the user, instantly suggest to create a track
    # ---------------------------------------------------------
    @track_new = Track.new
    @new = params[:new] || false # will be 'true' if the opinion has just been created
  end

  def create
    # ---------------------------------------------------------
    # USER STORIES
    # - creating a new opinion
    # ---------------------------------------------------------
    opinion = Opinion.new(opinion_params)
    opinion.creator = current_user
    @new = true
    if opinion.save
      @track_new = Track.new
      redirect_to opinion_path(opinion, new: true)
    else
      @opinions = Opinion.all
      @random_opinions = Opinion.order('RANDOM()').limit(6)
      @opinion_new = Opinion.new
      render :index
    end
  end

  # ! admin only
  def update
    if @opinion.update(opinion_params)
      redirect_to opinion_path(@opinion)
    else
      render_show
    end
  end

  # ! admin only
  def destroy
    if @opinion.destroy
      redirect_to opinions_path
    else
      render_show
    end
  end

  private

  def set_opinion
    @opinion = Opinion.find(params[:id])
    authorize @opinion
  end

  def opinion_params
    params.require(:opinion).permit(:name, :description)
  end

  def render_show
    @track_new = Track.new
    @new = params[:new] || false
    render :show
  end
end
