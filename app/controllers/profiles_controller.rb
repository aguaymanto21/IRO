class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    if current_user.profile
      redirect_to profile_path(current_user.profile)
    else
      redirect_to new_profile_path
    end
  end

  def show
  end

  def new
    if current_user.profile
      redirect_to profile_path(current_user.profile), alert: 'You already have a profile.'
    else
      @profile = Profile.new
    end
  end

  def create
    if current_user.profile
      redirect_to profile_path(current_user.profile), alert: 'You already have a profile.'
    else
      @profile = current_user.build_profile(profile_params)
      if @profile.save
        redirect_to @profile, notice: 'Profile was successfully created.'
      else
        render :new
      end
    end
  end

  def edit
  end

  def update
    if @profile.update(profile_params)
      redirect_to @profile, notice: 'Profile was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @profile.destroy
    redirect_to new_profile_path, notice: 'Profile was successfully deleted.'
  end

  private

  def set_profile
    @profile = current_user.profile
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar, mood: [])
  end
end
