require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    it 'ニックネームが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'メールアドレスが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'メールアドレスは@を含まないと登録できない' do
      @user.email = 'userexample.com'
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'パスワードが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end

    it 'パスワードが6文字以上でないと登録できない' do
      @user.password = '1a2b3'
      @user.password_confirmation = '1a2b3'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'パスワードが半角英字のみでは登録できない' do
      @user.password = 'abcdef'
      @user.password_confirmation = 'abcdef'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードが半角数字のみでは登録できない' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードが全角文字を含む場合は登録できない' do
      @user.password = 'ABC123あ'
      @user.password_confirmation = 'ABC123あ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end

    it 'パスワードとパスワード（確認）が一致しないと登録できない' do
      @user.password = '1a2b3c'
      @user.password_confirmation = '3c2b1a'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
  end
end
