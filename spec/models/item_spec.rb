require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end
  describe '出品登録' do
    context '出品登録ができるとき'
    it '商品画像、商品名、商品の説明、カテゴリー、商品の状態、配送料の負担、発送元の地域、発送までの日数、販売価格が存在すれば登録できる' do
      expect(@item).to be_valid
    end
    it '販売価格は、¥300~¥9,999,999の間のみ保存可能であること' do
      @item.price = '300' 
      expect(@item).to be_valid
    end
    

    context '出品登録ができない' 
    
    
    it '商品画像を1枚つけないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '商品名が空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")      
    end
    it '商品の説明が空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end
    it 'カテゴリーの情報が空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Category can't be blank", "Category is not a number")
    end
    it '商品の状態についての情報が空だと登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Status can't be blank", "Status is not a number")
    end
    it '配送料の負担についての情報が空だと登録できない' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping cost can't be blank", "Shipping cost is not a number")
    end
    it '発送元の地域についての情報が空だと登録できない' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping area can't be blank", "Shipping area is not a number")
    end
    it '発送までの日数についての情報が空だと登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day can't be blank", "Shipping day is not a number")
    end
    it '販売価格についての情報が空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include
      ("Price is not included in the list")
    end
    it '販売価格は、¥300以下だと登録できない' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
    it '販売価格は全角数字だと登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not included in the list")
    end
   end
  end
