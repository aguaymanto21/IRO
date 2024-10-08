class FriendshipsController < ApplicationController
  def index
    @friends = current_user.friends
  end

  def create
    @friend = User.find(params[:friend_id])
    current_user.friendships.create(friend: @friend)
    redirect_to friends_path, notice: 'Friend added!'
  end

  def destroy
    @friendship = current_user.friendships.find_by(friend_id: params[:id])
    @friendship.destroy
    redirect_to friends_path, notice: 'Friend removed!'
  end
end
