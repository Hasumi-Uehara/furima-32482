class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_item,           only: [:show, :edit, :update, :destroy]
  before_action :move_to_index,      only: [:edit, :update]

  def index
    @items = Item.includes(:user).order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to action: :index
    else
      render action: :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to action: :show
    else
      render action: :edit
    end
  end

  def destroy
    @item.destroy if current_user.id == @item.user_id
    redirect_to action: :index
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def move_to_index
    unless (current_user.id == @item.user_id) && Order.where(item_id: @item.id).blank?
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:image, :name, :info, :category_id, :sales_status_id, :shopping_fee_status_id, :prefecture_id,
                                 :scheduled_delivery_id, :price).merge(user_id: current_user.id)
  end
end
