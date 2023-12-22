class FriendshipsController < ApplicationController

  # unused code can be deleted

  # def create
  #   friend = User.find(params[:friend_id])
  #   # Assuming the current_user is initiating the friendship request
  #   if current_user && current_user != friend
  #     friendship = Friendship.find_by(user_id: current_user.id, friend_id: friend.id)

  #     unless friendship
  #       Friendship.create(user_id: current_user.id, friend_id: friend.id)
  #       flash[:success] = 'Friend request sent!'
  #     end
  #   end
  #   redirect_to user_friends_path(current_user)_path
  # end
  def accept
    @friend_request = FriendRequest.find(params[:id])
    @friend_request.accept!

    # Add your Friendship creation logic here

    redirect_to user_friends_path(current_user), notice: "Friend request accepted."
  end
end
