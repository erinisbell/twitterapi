class TweetsController < ApplicationController
  before_action :authenticate_user!, only: [:create]
  # before_action :set_tweet, only: [:show, :update, :destroy]

  def index
    if params[:q]
        tweets = Tweet.where("email ILIKE ?", "%#{params[:q]}%")
      else
        tweets = Tweet
      end
    tweets = tweets.page(params[:page]).per(params[:size])
    render json: tweets, include: params[:include]
  end

  def show
    tweet = Tweet.find(params[:id])
    render json: tweet, include: params[:include]
  end

  def create
    tweet = Tweet.new(tweet_params)
    tweet.user_id = current_user.id
    if tweet.save
      render json: tweet, status: :created
    else
      render json: tweet.errors, status: :unprocessable_entity
    end
  end


  private
  def tweet_params
    params.require(:tweet).permit(:body)
  end
end
