class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_index, only:[:index, :create]
  before_action :sold_out_item, only: [:index]

  def index
    @order_destination = OrderDestination.new
    if current_user == @item.user
      redirect_to  root_path
  end
end
  # 修正箇所↓
  def new
  end
  # 修正箇所↓
  def create
    @order_destination = OrderDestination.new(order_params)
    if @order_destination.valid?
      pay_item
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
  end

  def pay_item
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create(
        amount: @item.price,
        card: order_params[:token],
        currency: 'jpy'
      )
  end
  # 修正箇所↓
  def set_index
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    if @item.order.present?
      redirect_to root_path
  end
 end
end