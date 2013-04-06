class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    Rails.logger.info '==================================='
    @message = Message.first
    Rails.logger.info @message.inspect
    Rails.logger.info '==================================='
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @message = Message.first
    @message.text = params[:text]
    @message.save
  end

  def get_all
    @users = User.find(:all, :select => "name, score")
  end

end
