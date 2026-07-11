class ListController < ApplicationController
  def index
    @lists = List.all
  end

  def show
    @list = List.find(params[:id])
  end

  def new
   @list = List.new
  end

  def create
   @list = List.new(list_params)
   if @list.save
     redirect_to list_path(@list)
     flash[:notice] = "save successful"
   else
    flash[:alert] = "save unsuccessful"
    render :new
   end
  end

  def edit
   @list = List.find(params[:id])
  end

  def update
    @list = List.find(params[:id])
    if @list.update(list_params)
      redirect_to list_path(@list)
      flash[:notice] = "update successful"
    else
      render :edit
      flash[:alert] = "update unsuccessful"
    end
  end

  def destroy
    @list = List.find(params[:id])
    @list.destroy
    redirect_to lists_path
    flash[:notice] = "deleted"
  end
  private

  def list_params
    params.require(:list).permit(:name)
  end
end
