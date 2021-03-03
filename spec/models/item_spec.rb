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
      @item.price = 300
      expect(@item).to be_valid
    end

    context '出品登録ができない'

    it '商品画像を1枚つけないと登録できない' do
      @item.images = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("画像を入力してください")
    end
    it '商品名が空だと登録できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("名前を入力してください")
    end
    it '商品の説明が空だと登録できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の説明を入力してください")
    end
    it 'カテゴリーの情報が空だと登録できない' do
      @item.category_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
    end
    it '商品の状態についての情報が空だと登録できない' do
      @item.status_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("商品の状態を入力してください")
    end
    it '配送料の負担についての情報が空だと登録できない' do
      @item.shipping_cost_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
    end
    it '発送元の地域についての情報が空だと登録できない' do
      @item.shipping_area_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
    end
    it '発送までの日数についての情報が空だと登録できない' do
      @item.shipping_day_id = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
    end
    it '販売価格についての情報が空だと登録できない' do
      @item.price = ''
      @item.valid?
      expect(@item.errors.full_messages).to include
      ('金額は一覧にありません')
    end
    it 'カテゴリーは1を選択している場合登録できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
    end
    it '商品の状態は1を選択している場合登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
    end
    it '配送料については1を選択している場合登録できない' do
      @item.shipping_cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
    end
    it '発送元の地域は1を選択している場合登録できない' do
      @item.shipping_area_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
    end
    it '発送までの日数は1を選択している場合登録できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
    end
    it '販売価格は、¥300以下だと登録できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は一覧にありません')
    end
    it '販売価格は全角数字だと登録できない' do
      @item.price = '３００'
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は一覧にありません')
    end
    it '半角英数混合では登録できないこと' do
      @item.price = '299aaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は一覧にありません')
    end
    it '半角英語だけでは登録できないこと' do
      @item.price = 'aaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は一覧にありません')
    end
    it '10000000円以上では登録できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('金額は一覧にありません')
    end
  end
end
