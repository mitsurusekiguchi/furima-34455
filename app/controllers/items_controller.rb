class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :set_index, only: [:edit, :show, :update, :destroy]
  before_action :move_to_index, only: [:edit, :update, :destroy]

  def index
    @item = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @message = Message.new
    @messages = @item.messages
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.destroy
  end

  private

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :category_id,
      :status_id,
      :shipping_cost_id,
      :shipping_area_id,
      :shipping_day_id,
      :price,
      images: []
    ).merge(user_id: current_user.id)
  end

  def set_index
    @item = Item.find(params[:id])
  end

  def move_to_index
    redirect_to action: :index if current_user != @item.user || @item.order.present?
  end
end
