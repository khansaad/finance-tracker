class FriendshipsController < ApplicationController
=begin
  def my_friends
    @tracked_friends = current_user.friends
  end
=end
  def create
    friend = User.find(params[:friend])
    current_user.friendships.build(friend_id: friend.id)
    if current_user.save
      flash[:notice] = "Started following"
    else
      flash[:alert] = "Something went wrong. Please try again"
    end
    redirect_to my_friends_path
  end

  def destroy
    friendship = current_user.friendships.where(friend_id: params[:id]).first
    friendship.destroy
    flash[:notice] = "Stopped following"
    redirect_to my_friends_path
  end

end
