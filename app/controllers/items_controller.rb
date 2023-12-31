class ItemsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create,:edit, :update,:destroy]
  before_action :set_item, only: [:show, :edit, :update,:destroy]
  before_action :redirect_unless_author, only: [:edit, :update, :destroy]
  before_action :redirect_if_sold_out, only: [:edit, :update]


  def index
    @items = Item.all.order("created_at DESC")
  end

  def new
    @item = Item.new
  end

  def show
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
  end
    
  def update
    if @item.update(item_params)
      redirect_to item_path(@item)
    else
      render :edit,status: :unprocessable_entity
    end
  end

  def destroy
    @item.destroy
    redirect_to root_path
  end

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

  def redirect_if_sold_out
    if @item.purchase.present?
      redirect_to root_path
    end
  end
  
end