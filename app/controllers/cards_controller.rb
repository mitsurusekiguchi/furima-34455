class CardsController < ApplicationController
  def new
  end

  def create
    # カードトークンと顧客トークンをデータベースに保存
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    customer = Payjp::Customer.create(
      description: 'test',
      card: params[:token]
    )
    # トークン化されたカード情報をデータベースに保存
    @card = Card.new(
    card_token: params[:token],
    customer_token: customer.id,
    user_id: current_user.id
    )
    # カードの登録後はトップページにリダイレクトされる
    if @card.save
      redirect_to root_path
    else
      redirect_to "new" 
    end
  end
end
