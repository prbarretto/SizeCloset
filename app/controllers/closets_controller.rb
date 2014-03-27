class ClosetsController < ApplicationController
  before_action :set_closet, only: [:show, :edit, :update, :destroy]
  helper_method :sort_column, :sort_direction

  def index
    @closets = Closet.order(sort_column + ' ' + sort_direction)
  end

  def show
  end

  def new
    @closet = Closet.new
  end

  def edit
  end

  def create
    @closet = Closet.new(closet_params)

    respond_to do |format|
      if @closet.save
        format.html { redirect_to @closet, notice: 'An item was added to your closet.' }
        format.json { render action: 'show', status: :created, location: @closet }
      else
        format.html { render action: 'new' }
        format.json { render json: @closet.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @closet.update(closet_params)
        format.html { redirect_to @closet, notice: 'Your item was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @closet.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @closet.destroy
    respond_to do |format|
      format.html { redirect_to root_path }
      format.json { head :no_content }
    end
  end

  private
  def set_closet
    @closet = Closet.find(params[:id])
  end

  def closet_params
    params.require(:closet).permit(:id, :user_id, :store, :category, :size, :style, :note)
  end

  def sort_column
    Closet.column_names.include?(params[:sort]) ? params[:sort] : "store"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ?  params[:direction] : "asc"
  end
end
