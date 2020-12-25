require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '商品購入がうまくいくとき' do
      it '必須項目が全て正しく入力されていれば購入できる' do
        expect(@user_order).to be_valid
      end
      it 'ビル名が空でも他の項目が全て正しく入力されていれば購入できる' do
        @user_order.building = nil
        expect(@user_order).to be_valid
      end
    end

    context '商品購入ができないとき' do
      it '郵便番号が空だと購入できない' do
        @user_order.postal_code = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンが無いと購入できない' do
        @user_order.postal_code = "1234567"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空だと購入できない' do
        @user_order.prefecture_id = 1
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Prefecture can't be blank")
      end
      it '市区町村が空だと購入できない' do
        @user_order.city = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("City can't be blank")
      end
      it '番地が空だと購入できない' do
        @user_order.addresses = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Addresses can't be blank")
      end
      it '電話番号が空だと購入できない' do
        @user_order.phone_number = nil
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @user_order.phone_number = "090-1234-5678"
        @user_order.valid?
        expect(@user_order.errors.full_messages).to include("Phone number is invalid")
      end
    end
  end
end
