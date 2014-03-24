class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user = User.new
  end

  def create
    entry =
  end
end
