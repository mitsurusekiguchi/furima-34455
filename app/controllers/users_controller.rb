class UsersController < ApplicationController
  def show
    # ログインしているユーザーに紐付くカード情報を取得
    Payjp.api_key = ENV['PAYJP_SECRET_KEY']
    card = Card.find_by(user_id: current_user.id)
    # カード登録を優先するように設定
    redirect_to new_card_path and return unless card.present?

    # カード情報を元に顧客情報を取得
    customer = Payjp::Customer.retrieve(card.customer_token)
    @card = customer.cards.first
  end
end
