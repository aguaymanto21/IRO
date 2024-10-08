class AchievementsController < ApplicationController
  def new
    @achievement = Achievement.new
  end

  def create
    @achievement = current_user.achievements.build(achievement_params)
    if @achievement.save
      redirect_to user_path(current_user), notice: 'Achievement created successfully.'
    else
      render :new
    end
  end

  def edit
    @achievement = current_user.achievements.find(params[:id])
  end

  def update
    @achievement = current_user.achievements.find(params[:id])
    if @achievement.update(achievement_params)
      redirect_to user_path(current_user), notice: 'Achievement updated successfully.'
    else
      render :edit
    end
  end

  def destroy
    @achievement = current_user.achievements.find(params[:id])
    @achievement.destroy
    redirect_to user_path(current_user), notice: 'Achievement deleted.'
  end

  private

  def achievement_params
    params.require(:achievement).permit(:name, :description, :date)
  end
end
