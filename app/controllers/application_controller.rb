class ApplicationController < ActionController::Base
  skip_forgery_protection
  before_action :authenticate_user!, only: [:show, :edit, :update, :destroy]
end
