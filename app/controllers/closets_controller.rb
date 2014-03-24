class ClosetsController < ApplicationController
  before_action :set_closet_item, only: [:show, :edit, :update, :destroy]

  def index
    @closets = Closet.all
  end

  def show
  end

  def new
    @closet = Closet.new
  end

  def edit
  end

  def create
    @closet_item = Closet.new(closet_params)

    respond_to do |format|
      if @closet_item.save
        format.html { redirect_to @closet_item, notice: 'An item was added to your closet.' }
        format.json { render action: 'show', status: :created, location: @closet_item }
      else
        format.html { render action: 'new' }
        format.json { render json: @closet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @closet_item.update(closet_item_params)
        format.html { redirect_to @closet_item, notice: 'Your item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @closet_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @closet_item.destroy
    respond_to do |format|
      format.html { redirect_to closet_item_url }
      format.json { head :no_content }
    end
  end

  private
  def set_closet_item
      @closet_item = Closet.find(params[:id])
    end

  def closet_params
    params.require(:closet).permit(:id, :user_id, :store, :category, :size)
  end
end
