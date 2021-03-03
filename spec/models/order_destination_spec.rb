require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item, user_id: user.id)
    item.save
    @order = FactoryBot.build(:order_destination, item_id: item.id, user_id: user.id)
    sleep(0.5)
end
describe '商品購入' do
  context '商品が購入できるとき'
  it 'カード情報、有効期限、セキュリティコード、郵便番号、都道府県、市区町村、番地、建物名、電話番号が存在すれば登録できる' do
    expect(@order).to be_valid
  end
  it '建物名がなくても登録できる' do
    @order.building_name = ''
    expect(@order).to be_valid
  end
  
  context '商品が購入できないとき'

  it 'カード情報が存在しないと登録ができない' do
    @order.token = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("カード情報を入力してください")
  end

  it '郵便番号が存在しないと登録ができない' do
    @order.post_code = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("郵便番号を入力してください")
  end
  it '郵便番号にハイフンが存在しないと登録ができない' do
    @order.post_code = '1234567'
    @order.valid?
    expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
   end
   it '郵便番号が全角英数字だと登録ができない' do
    @order.post_code = '１２３ー４５６７'
    @order.valid?
    expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
   end
   it '郵便番号が半角英字だと登録ができない' do
    @order.post_code = 'aaaaaaa'
    @order.valid?
    expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
   end
   it '郵便番号が全角英字だと登録ができない' do
    @order.post_code = 'ａａａ−ａａａａ'
    @order.valid?
    expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
   end
   it '郵便番号が半角英字、数字混合だと登録ができない' do
    @order.post_code = '123-abcd'
    @order.valid?
    expect(@order.errors.full_messages).to include("郵便番号は不正な値です")
   end
   it '都道府県が存在しないと登録ができない' do
    @order.shipping_area_id = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("都道府県を入力してください")
   end
   it '都道府県が1だと登録ができない' do
    @order.shipping_area_id = 1
    @order.valid?
    expect(@order.errors.full_messages).to include("都道府県は1以外の値にしてください")
   end
   it '市区町村が空だと登録ができない' do
    @order.city = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("市区町村を入力してください")
   end
   it '番地が空だと登録ができない' do
    @order.address = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("番地を入力してください")
   end
   it '電話番号が空だと登録ができない' do
    @order.phone_number = ''
    @order.valid?
    expect(@order.errors.full_messages).to include("電話番号を入力してください")
   end
   it '電話番号にハイフンをつけると登録ができない' do
    @order.phone_number = '080-1234-5678'
    @order.valid?
    expect(@order.errors.full_messages).to include("電話番号は不正な値です")
   end
   it '電話番号が全角英数字だと登録ができない' do
    @order.phone_number = '０８０１２３４５６７８'
    @order.valid?
    expect(@order.errors.full_messages).to include("電話番号は不正な値です")
   end
   it '電話番号が半角英字だと登録ができない' do
    @order.phone_number = 'aaaaaaaaaaa'
    @order.valid?
    expect(@order.errors.full_messages).to include("電話番号は不正な値です")
   end
   it '電話番号が半角英数字と英字混合だと登録ができない' do
    @order.phone_number = '080abcd1234'
    @order.valid?
    expect(@order.errors.full_messages).to include("電話番号は数値で入力してください")
   end
    it '電話番号が12桁以上だと登録ができない' do
      @order.phone_number = '080123456789'
      @order.valid?
      expect(@order.errors.full_messages).to include("電話番号は不正な値です")
   end
  end
end