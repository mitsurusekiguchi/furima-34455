class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_index, only: [:index, :create]
  before_action :sold_out_item, only: [:index]
  before_action :card_info, only: [:index, :create]

  def index
    @order_destination = OrderDestination.new
    redirect_to root_path if current_user == @item.user
  end

  def create
    customer_token = current_user.card.customer_token # ログインしているユーザーの顧客トークンを定義
    @order_destination = OrderDestination.new(order_params)

    if @order_destination.valid?
      Payjp::Charge.create(
        amount: @item.price,
        customer: customer_token,
        currency: 'jpy'
      )
      @order_destination.save
      redirect_to root_path
    else
      render :index
    end
  end

  private

  def order_params
    params.require(:order_destination).permit(:post_code, :shipping_area_id, :city, :address, :building_name, :phone_number).merge(
      user_id: current_user.id, item_id: @item.id, token: params[:token]
    )
  end

  def set_index
    @item = Item.find(params[:item_id])
  end

  def sold_out_item
    redirect_to root_path if @item.order.present?
  end

  def card_info
    redirect_to new_card_path and return unless current_user.card.present?
    Payjp.api_key = ENV['PAYJP_SECRET_KEY'] # 環境変数を読み込む
    card = Card.find_by(user_id: current_user.id) # ユーザーのid情報を元に、カード情報を取得
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
end
