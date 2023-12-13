class UsersController < ApplicationController
  def index
    @users = User.all
    @q = User.ransack(params[:q])
    @users = @q.result(distinct: true)
    if params[:q].present? && !params[:q].values.all?(&:blank?)
      @users = @q.result(distinct: true)
    else
      @users = User.none
    end
    # comment out lines 6-10 if all users need to be viewed
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
    @user = User.find_by(username: params[:username])
    @accepted_requests = @user&.accepted_received_friend_requests
  end


end
