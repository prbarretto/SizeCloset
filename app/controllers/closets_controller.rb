class ClosetsController < ApplicationController
  def index
    @closets = Closet.all
  end

  def show
    @closet = Closet.new
  end

  def create
    closet_item = Closet.create!(closet_params)
    render json: closet_item
  end

  private

  def closet_params
    params.require(:closet).permit(:id, :user_id, :store, :category, :size)
  end
end
