require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまく行く時' do
      it 'nickname, email, password, password_confirmation, family_name, first_name, family_name_kana, first_name_kana, birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'passwordが６文字以上であれば登録できること' do
        @user.password = 'aa0000'
        @user.password_confirmation = 'aa0000'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかない時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it 'passwordが空では登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できないこと' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'psaawordが5文字以下であれば登録できないこと' do
        @user.password = 'aa0000'
        @user.password_confirmation = 'aa000'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'passwordは英字のみでは登録できない' do
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it 'passwordは数字のみでは登録できない' do
        @user.password = '000000'
        @user.password_confirmation = '000000'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password には英字と数字の両方を含めて設定してください')
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'family_nameが空では登録できないこと' do
        @user.family_name = nil
        @user.valid?
        expect(@user.errors[:family_name]).to include('全角文字を使用してください')
      end
      it 'first_nameが空では登録できないこと' do
        @user.first_name = nil
        @user.valid?
        expect(@user.errors[:first_name]).to include('全角文字を使用してください')
      end
      it 'family_name_kanaが空では登録できないこと' do
        @user.family_name_kana = nil
        @user.valid?
        expect(@user.errors[:family_name_kana]).to include("can't be blank", 'カナ（全角文字）を使用してください')
      end
      it 'first_name_kanaが空では登録できないこと' do
        @user.first_name_kana = nil
        @user.valid?
        expect(@user.errors[:first_name_kana]).to include("can't be blank", 'カナ（全角文字）を使用してください')
      end
      it 'birthdayが空では登録できないこと' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      describe '全角文字' do
        it 'family_nameが全角ではないなら登録できない' do
          @user.family_name = 'aaa'
          @user.valid?
          expect(@user.errors.full_messages).to include('Family name 全角文字を使用してください')
        end
        it 'first_nameは全角ではないなら登録できない' do
          @user.first_name = 'family'
          @user.valid?
          binding.pry
          expect(@user.errors.full_messages).to include('First name 全角文字を使用してください')
        end
        it 'family_name_kanaは全角カナではないなら登録できない' do
          @user.family_name_kana = 'あああああ'
          @user.valid?
          expect(@user.errors[:family_name_kana]).to include('カナ（全角文字）を使用してください')
        end
        it 'first_name_kanaは全角カナではないなら登録できない' do
          @user.first_name_kana = 'あああああ'
          @user.valid?
          expect(@user.errors[:first_name_kana]).to include('カナ（全角文字）を使用してください')
        end
      end
    end
  end
end
