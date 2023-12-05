class UsersController < ApplicationController
  def show
    @user = User.find_by!(username: params[:username])
  end

  def peer
    @user = User.find_by!(username: params[:username])
  end
end
