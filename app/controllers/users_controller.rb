class UsersController < ApplicationController
  before_filter :authenticate_user!

  def index
    authorize! :index, @user, :message => 'Not authorized as an administrator.'
    @message = Message.first
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

end
