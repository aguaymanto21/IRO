class MoodsController < ApplicationController
  before_action :set_profile, only: [:new, :create, :edit, :update, :destroy]
  before_action :set_mood, only: [:edit, :update, :destroy]

  # GET /profiles/:profile_id/moods/new
  def new
    @mood = @profile.moods.build
  end

  # POST /profiles/:profile_id/moods
  def create
    @mood = @profile.moods.build(mood_params)
    if @mood.save
      redirect_to profile_path(@profile), notice: 'Mood was successfully saved.'
    else
      render :new
    end
  end

  # GET /profiles/:profile_id/moods/:id/edit
  def edit
  end

  # PATCH/PUT /profiles/:profile_id/moods/:id
  def update
    if @mood.update(mood_params)
      redirect_to profile_path(@profile), notice: 'Mood was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /profiles/:profile_id/moods/:id
  def destroy
    @mood.destroy
    redirect_to profile_path(@profile), notice: 'Mood was successfully deleted.'
  end

  private

  def set_profile
    @profile = Profile.find(params[:profile_id])
  rescue ActiveRecord::RecordNotFound
    redirect_to profiles_path, alert: 'Profile not found.'
  end

  def set_mood
    @mood = @profile.moods.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    redirect_to profile_path(@profile), alert: 'Mood not found.'
  end

  def mood_params
    params.require(:mood).permit(:mood, :description)
  end
end
