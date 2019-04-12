class TweetsController < ApplicationController

  before_action :move_to_index, :except => [:index, :show]

  def index
    @tweets = Tweet.includes(:user).page(params[:page]).per(6).order("created_at DESC")
    @puu = Puu.order("RAND()").first
    @puus = Puu.order("id ASC")
  end

  def new
  end

  def create
    Tweet.create(name: params[:name], image: params[:image], text: params[:text], user_id: current_user.id)
  end

  def destroy
    tweet = Tweet.find(params[:id])
    tweet.destroy
  end

  def edit
    @tweet = Tweet.find(params[:id])
  end

  def update
    tweet = Tweet.find(params[:id])
    tweet.update(tweet_params)
  end

   def show
    @tweets = Tweet.includes(:user).page(params[:page]).per(6).order("created_at DESC")
    @puus = Puu.find(params[:id])
  end

  private
  def tweet_params
    params.permit(:image, :text)
  end

  def move_to_index
    redirect_to :action => "index" unless user_signed_in?
  end

end
