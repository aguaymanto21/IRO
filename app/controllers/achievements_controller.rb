class AchievementsController < ApplicationController
  before_action :set_profile, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_achievement, only: [:edit, :update, :destroy]

  def index
    @profile = Profile.find(params[:profile_id])
    @achievements = @profile.achievements
  end

  def new
    @achievement = @profile.achievements.new
  end

  def create
    @achievement = @profile.achievements.new(achievement_params)
    @achievement.user = current_user # Associate the achievement with the logged-in user

    if @achievement.save
      redirect_to profile_achievements_path(@profile), notice: 'Achievement was successfully created.'
    else
      render :new
    end
  end



  def edit
    @achievement = @profile.achievements.find(params[:id])
  end


  def update
    if @achievement.update(achievement_params)
      redirect_to profile_path(@profile), notice: 'Achievement was successfully updated.'
    else
      render :edit
    end
  end


  def destroy
    @achievement.destroy
    redirect_to profile_path(@profile), notice: "Achievement was successfully deleted."
  end


  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  end

  def set_achievement
    @achievement = @profile.achievements.find(params[:id])
  end

  def achievement_params
    params.require(:achievement).permit(:name, :description, :date, :image)
  end
end
