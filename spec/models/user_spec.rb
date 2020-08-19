require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "全ての項目が存在すれば登録できる" do
        expect(@user).to be_valid
      end

      it "nicknameが6字以内であれば登録できる" do
        @user.nickname = "ジョン"
        expect(@user).to be_valid
      end

      it "emailに@を含んでいれば登録できる" do
        @user.email = "a@gmail.com"
        expect(@user).to be_valid
      end

      it "passwordが6文字以上であれば登録できる" do
        @user.password = "00000a"
        @user.password_confirmation = "00000a"
        expect(@user).to be_valid
      end

      it "passwordが半角英数字混合であれば登録できる" do
        @user.password = "000aaa"
        @user.password_confirmation = "000aaa"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it "重複したnicknameが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.nickname = @user.nickname
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Nickname has already been taken")
      end

      it "nicknameが7文字以上であれば登録できない" do
        @user.nickname = "あいうえおかき"
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname is too long (maximum is 6 characters)")
      end

      it "emailが空では登録できない" do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end

      it "emailに＠を含んでいなければ登録できない" do
        @user.email = "abcdefg"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it "passwordが空では登録できない" do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it "passwordが5文字以下であれば登録できない" do
        @user.password = "0000a"
        @user.password_confirmation = "0000a"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it "passwordに半角英数字以外の文字が含まれていたら登録できない" do
        @user.password = "abcd1234あ"
        @user.password_confirmation = "abcd1234あ"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角英字のみでは登録できない" do
        @user.password = "aaaaaaaaa"
        @user.password_confirmation = "aaaaaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it "passwordが半角数字のみでは登録できない" do
        @user.password = "11111111"
        @user.password_confirmation = "11111111"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

    end
  end
end