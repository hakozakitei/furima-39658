class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  #  before_action :set_item, only: [:edit, :update]
  #  before_action :redirect_unless_author, only: [:edit, :update]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
    @item = Item.find(params[:id])
  end

  def create
    @item = Item.new(item_params)
    @item.user = current_user
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @item = Item.find(params[:id])
    end
    
   # def update 
   #  if @item.update(item_params)
   #    redirect_to item_path(@item)
   #   else
   #   render :edit 
   #   end
   # end

  private

  def item_params
    params.require(:item).permit(:name, :description, :price, :category_id, :condition_id, :shipping_fee_burden_id, :shipping_origin_id, :shipping_day_id, :image)
  end

  def set_item
    @item = Item.find(params[:id])
  end
  
  def redirect_unless_author
    redirect_to root_path unless current_user == @item.user
  end
end