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
    @profile = Profile.find(params[:id])
    @past_moods = @profile.moods.order(created_at: :desc).limit(10) # Adjust limit as needed
    @mood = @profile.moods.build
    @latest_mood = @profile.moods.order(created_at: :desc).first # Get the most recent mood
    @past_moods = @profile.moods.order(created_at: :desc) # Fetch past moods in descending order

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
