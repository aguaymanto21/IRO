class UsersController < ApplicationController
  before_action :authenticate_user!



  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
    @achievements = @user.achievements
    @friends = @user.friends
    @support_groups = @user.support_groups
  end
end
