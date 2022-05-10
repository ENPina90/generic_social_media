class ProfilesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :index ]

  def new
    @profile = Profile.new
  end

  def create
    @profile = Profile.new(profile_params)
    @profile.user = current_user
    if @profile.save
      redirect_to profile_path(@profile)
    else
      render :new
    end
  end

  def show
    @user = current_user
    if @user.profile.nil?
      redirect_to new_profile_path
    else
      @profile = Profile.find(params[:id])
    end
  end

  def index
    @profiles = Profile.all
  end

  private

  def set_profile
    @profile = Profile.find(params[:id])
  end

  def profile_params
    params.require(:profile).permit(:name, :address, :birthday, :sex, :orientation, photos: [])
  end
end
