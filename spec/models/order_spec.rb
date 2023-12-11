require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item,user:user)
    @order_form = FactoryBot.build(:order_form, user_id: user.id, item_id: item.id)
  end

  context '内容に問題ない場合' do
    it 'token, postal_code, phone_number, city, addressが存在すれば保存ができること' do
      expect(@order_form).to be_valid
    end
    it '建物名が空でも購入できる' do
      @order_form.building_name = ''
      expect(@order_form).to be_valid
    end
  end

  context '内容に問題がある場合' do
    it 'tokenが空では保存ができないこと' do
      @order_form.token = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存ができないこと' do
      @order_form.postal_code = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'phone_numberが空では保存ができないこと' do
      @order_form.phone_number = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'cityが空では保存ができないこと' do
      @order_form.city = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("City can't be blank")
    end

    it 'addressが空では保存ができないこと' do
      @order_form.address = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Address can't be blank")
    end

    it 'postal_codeが無効な形式では保存ができないこと' do
      @order_form.postal_code = '1234567'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Postal code is invalid. Enter it as follows (e.g. 123-4567)")
    end

    it '電話番号が9桁以下では購入できない' do
      @order_form.phone_number = '123456789'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it '電話番号が12桁以上では購入できない' do
      @order_form.phone_number = '123456789012'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it '電話番号に半角数字以外が含まれている場合は購入できない' do
      @order_form.phone_number = '090-1234-5678'
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Phone number is invalid. Input only number")
    end

    it '都道府県に「---」が選択されている場合は購入できない' do
      @order_form.shipping_origin_id = 0
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Shipping origin can't be blank")
    end

    it 'userが紐付いていなければ購入できない' do
      @order_form.user_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("User can't be blank")
    end

    it 'itemが紐付いていなければ購入できない' do
      @order_form.item_id = nil
      @order_form.valid?
      expect(@order_form.errors.full_messages).to include("Item can't be blank")
    end
  end
end
