class ProfilesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_profile, only: [:show, :edit, :update, :destroy]

  def index
    @profiles = current_user.profiles  # Fetch profiles for the logged-in user
  end

  def show
  end

  def new
    @profile = current_user.profiles.build
  end

  def create
    @profile = current_user.profiles.build(profile_params)
    if @profile.save
      redirect_to @profile, notice: 'Profile was successfully created.'
    else
      render :new
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
    redirect_to profiles_url, notice: 'Profile was successfully deleted.'
  end

  private

  def set_profile
    @profile = current_user.profiles.find(params[:id])  # Ensure the profile belongs to the current user
  end

  def profile_params
    params.require(:profile).permit(:name, :bio, :avatar)
  end
end
