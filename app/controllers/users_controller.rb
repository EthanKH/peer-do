class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def my_tasks
    @user = User.find_by!(username: params[:username])
  end

  def completed_tasks
    @user = User.find_by!(username: params[:username])
  end

  def show
    @user = User.find_by!(username: params[:username])
  end

  def peer
    @user = User.find_by!(username: params[:username])
  end

  def friends
    @user = User.find_by!(username: params[:username])
    @accepted_requests = FriendRequest.accepted.includes(:receiver)
  end


end
