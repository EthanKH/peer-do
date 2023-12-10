class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params[:username])
  end

  def peer
    @user = User.find_by!(username: params[:username])
  end

  def receiver
    @user = User.find_by!(username: params[:username])
    @accepted_requests = FriendRequest.accepted.includes(:receiver)
  end


end
