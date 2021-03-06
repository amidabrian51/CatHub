class ProfilesController < ApplicationController

  before_action :set_user
  before_action :authenticate_user!
  before_action :owned_profile, only: [:edit, :update]

  def show
    @user = User.find_by(petname: params[:petname])
    @posts = User.find_by(petname: params[:petname]).posts.order('created_at DESC')
  end

  def edit
    @user = User.find_by(petname: params[:petname])
  end

  def update
    @user = User.find_by(petname: params[:petname])
    if @user.update(profile_params)
      flash[:success] = 'Your profile has been updated.'
      redirect_to profile_path(@user.petname)
    else
      @user.errors.full_messages
      flash[:error] = @user.errors.full_messages
      render :edit
    end
  end

  private

  def set_user
    @user = User.find_by(petname: params[:petname])
  end

  def profile_params
    params.require(:user).permit(:avatar, :bio)
  end

  def owned_profile
    @user = User.find_by(petname: params[:petname])
    unless current_user == @user
      flash[:alert] = "You can't edit other peoples profiles."
      redirect_to root_path
    end
  end
end
