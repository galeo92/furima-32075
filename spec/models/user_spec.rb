require 'rails_helper'
describe User do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it "nicknameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
      it "passwordが6文字以上であれば登録できる" do
        @user.password = "00aa00"
        @user.password_confirmation = "00aa00"
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it "nicknameが空だと登録できない" do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it "emailが空では登録できない" do
        @user.email = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it "emailに「@」が含まれていないと登録できない" do
        @user.email = "@"
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end
      it "重複したemailが存在する場合登録できない" do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Email has already been taken")
      end
      it "passwordが空では登録できない" do
        @user.password = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it "passwordが5文字以下であれば登録できない" do
        @user.password = "00a00"
        @user.password_confirmation = "00a00"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end
      it "passwordが存在してもpassword_confirmationが空では登録できない" do
        @user.password_confirmation = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "名字(全角)が空では登録できない" do
        @user.last_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "名前(全角)が空では登録できない" do
        @user.first_name = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "名字(フリガナ)が空では登録できない" do
        @user.last_name_frigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name frigana is invalid. Input full-width katakana characters.")
      end
      it "名前(フリガナ)が空では登録できない" do
        @user.first_name_frigana = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("First name frigana is invalid. Input full-width katakana characters.")
      end
      it "生年月日がか空では登録できない" do
        @user.birthday = ""
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
      it "passwordが半角英字のみの場合登録できない" do
        @user.password = "aaaaaa"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードは英数字混合で入力してください")
      end
      it "passwordが半角数字のみの場合登録できない" do
        @user.password = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードは英数字混合で入力してください")
      end
      it "passwordが全角英数字の場合登録できない" do
        @user.password = "ｈｇｔｙ５６"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password パスワードは英数字混合で入力してください")
      end
      it "passwordとpassword_confirmationが一致しない場合登録できない" do
        @user.password = "123456"
        @user.password_confirmation = "234567"
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it "last_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
        @user.last_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid. Input full-width characters.")
      end
      it "first_nameが全角（漢字・ひらがな・カタカナ）以外の場合登録できない" do
        @user.first_name = "abc123"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid. Input full-width characters.")
      end
      it "last_name_friganaが全角（カタカナ）以外の場合登録できない" do
        @user.last_name_frigana = "abc123漢字あいう"
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name frigana is invalid. Input full-width katakana characters.")
      end
      it "first_name_friganaが全角（カタカナ）以外の場合登録できない" do
        @user.first_name_frigana = "abc123漢字あいう"
        @user.valid?
        expect(@user.errors.full_messages).to include("First name frigana is invalid. Input full-width katakana characters.")
      end
    end
  end
end
