require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'email、password、password_confirmationが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'emailに@が存在すれば登録できる' do
        @user.email = 'pop@pop'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上であれば登録できる' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc123'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'emailに@が無いと登録できない' do
        @user.email = 'poppop'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'abc12'
        @user.password_confirmation = 'abc12'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが存在してもpassword_confirmationが一致しないと登録できない' do
        @user.password = 'abc123'
        @user.password_confirmation = 'abc456'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが全角日本語でないと登録できない' do
        @user.first_name = "FURIMA"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it 'last_nameが全角日本語でないと登録できない' do
        @user.last_name = "TAROU"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it 'first_name_readingが全角カタカナでないと登録できない' do
        @user.first_name_reading = "ﾌﾘﾏ"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name reading is invalid. Input full-width katakana characters.")
      end
      it 'last_name_readingが全角カタカナでないと登録できない' do
        @user.last_name_reading = "ﾀﾛｳ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name reading is invalid. Input full-width katakana characters.")
      end
      it 'passwordが半角英語のみだと登録できない' do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
      it 'passwordが半角数字のみだと登録できない' do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid", "Password confirmation is invalid")
      end
    end
  end
end
