require 'rails_helper'

RSpec.describe Item, type: :model do
 before do
  @user = FactoryBot.create(:user) 
  @item = FactoryBot.build(:item, user: @user)
  @item.image.attach(io: File.open(Rails.root.join('public', 'image', 'test_image.png')), filename: 'test_image.png')

end

describe '商品の保存' do
  context '商品が保存できる場合' do
    it '全ての項目が正しく入力されていれば保存できる' do
      expect(@item).to be_valid
    end
  end

  context '商品が保存できない場合' do
    it 'nameが空では保存できない' do
      @item.name = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end
  end

    it 'descriptionが空では保存できない' do
      @item.description = ''
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'category_idが1では保存できない' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Category must be other than 1")
    end

    it 'condition_idが1では保存できない' do
      @item.condition_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Condition must be other than 1")
    end

    it 'shipping_fee_burden_idが1では保存できない' do
      @item.shipping_fee_burden_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping fee burden must be other than 1")
    end

    it 'shipping_origin_idが1では保存できない' do
      @item.shipping_origin_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping origin must be other than 1")
    end

    it 'shipping_day_idが1では保存できない' do
      @item.shipping_day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include("Shipping day must be other than 1")
    end

    it 'priceが空では保存できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが300未満では保存できない' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
    end

    it 'priceが9,999,999を超えると保存できない' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
    end

    it '画像がないと保存できない' do
      @item.image.detach
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end
    it '価格に半角数字以外が含まれている場合は出品できない' do
      @item.price = '1000円' # 半角数字以外を含む価格
      @item.valid?
      expect(@item.errors.full_messages).to include("Price is not a number")
    end

    it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("User must exist")
    end
  end
end