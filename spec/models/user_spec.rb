require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context 'ユーザ登録ができる時' do
      it 'すべての情報が正しく入力されていれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context 'ユーザ登録ができない時' do
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

    # お名前(全角)のテストケース
    it '名字が空では登録できない' do
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    
    it '名前が空では登録できない' do
     @user.last_name = ''
     @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    
    it '名字が全角でないと登録できない' do
      @user.first_name = 'Yamada'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    
    it '名前が全角でないと登録できない' do
      @user.last_name = 'Taro'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    
    # お名前カナ(全角)のテストケース
    it '名字カナが空では登録できない' do
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    
    it '名前カナが空では登録できない' do
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    
    it '名字カナが全角カタカナでないと登録できない' do
      @user.first_name_kana = 'やまだ'
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    
    it '名前カナが全角カタカナでないと登録できない' do
      @user.last_name_kana = 'たろう'
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    
    it '生年月日が空では登録できない' do
      @user.birth_date = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birth date can't be blank") 
    end

    it '重複したメールアドレスでは登録できない' do
      @user.save
      another_user = FactoryBot.build(:user, email: @user.email)
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
   end
  end
end
