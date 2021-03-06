require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー登録' do
    context 'ユーザー登録できるとき'
    it 'ニックネーム、メールアドレス、パスワード、パスワード（確認）、お名前（全角）、お名前カナ（全角）、生年月日が存在すれば登録できる' do
      expect(@user).to be_valid
    end
    it 'パスワードは、6文字以上での入力で登録できる' do
      @user.password = 'aaa123'
      @user.password_confirmation = 'aaa123'
      expect(@user).to be_valid
    end
    context 'ユーザー登録できないとき'
    it 'ニックネームが空では登録できない' do
      @user.nickname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('ニックネームを入力してください')
    end
    it 'メールアドレスが空だと登録できない' do
      @user.email = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールを入力してください')
    end
    it 'メールアドレスが重複すると登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include('Eメールはすでに存在します')
    end
    it 'メールアドレスは、@がないと登録できない' do
      @user.email = 'testtest.com'
      @user.valid?
      expect(@user.errors.full_messages).to include('Eメールは不正な値です')
    end
    it 'パスワードが空だと登録できない' do
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードを入力してください')
    end
    it 'パスワードが存在しても確認用を含めて2回入力しないと登録できない' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワード（確認用）とパスワードの入力が一致しません')
    end
    it 'パスワードが6文字以下では登録できない' do
      @user.password = 'aa123'
      @user.password_confirmation = 'aa123'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
    end
    it 'パスワードは、半角英数字混合での入力が必須であること（半角英数字が混合されていれば、登録が可能なこと）' do
      @user.password = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'パスワードは数字のみでは登録できないこと' do
      @user.password = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'パスワードは全角では登録できないこと' do
      @user.password = 'ａａａａａａ'
      @user.valid?
      expect(@user.errors.full_messages).to include('パスワードは不正な値です')
    end
    it 'ユーザー本名は、名字がないと登録できない' do
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字を入力してください')
    end
    it 'ユーザー本名は、名前がないと登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前を入力してください')
    end
    it 'ユーザー本名の名字は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.last_name = 'yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字は不正な値です')
    end
    it 'ユーザー本名の名前は全角（漢字・ひらがな・カタカナ）での入力が必須であること' do
      @user.first_name = 'tarou'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前は不正な値です')
    end
    it 'ユーザー本名のフリガナは、名字が必須であること' do
      @user.last_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）を入力してください')
    end
    it 'ユーザー本名のフリガナは、名前が必須であること' do
      @user.first_name_reading = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）を入力してください')
    end
    it 'ユーザー本名の名字のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.last_name_reading = '山田'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）は不正な値です')
    end
    it 'ユーザー本名の名前のフリガナは、全角（カタカナ）での入力が必須であること' do
      @user.first_name_reading = '太郎'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
    end
    it 'ユーザー本名の名字のフリガナは、半角（カタカナ）での入力が必須であること' do
      @user.last_name_reading = 'ﾔﾏﾀﾞ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名字（カナ）は不正な値です')
    end
    it 'ユーザー本名の名前のフリガナは、半角（カタカナ）での入力が必須であること' do
      @user.first_name_reading = 'ﾀﾛｳ'
      @user.valid?
      expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include('生年月日を入力してください')
    end
  end
end
