require 'rails_helper'

describe User do
  describe '#create' do
    it "名前、emailアドレス、パスワードがあれば登録できること" do
      user = build(:user)
      expect(user).to be_valid
    end

    it "emailアドレスがないと登録できないこと" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("can't be blank")
    end

    it "パスワードがないと登録できないこと" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("can't be blank")
    end

    it "パスワードが6文字以上であれば登録できること" do
      password = Faker::Internet.password(min_length: 6, max_length: 6)
      user = build(:user, password: password, password_confirmation: password)
      expect(user).to be_valid
    end

    it "パスワードが5文字以下だと登録できないこと" do
      password = Faker::Internet.password(min_length: 5, max_length: 5)
      user = build(:user, password: password, password_confirmation: password)
      user.valid?
      expect(user.errors[:password]).to include("is too short (minimum is 6 characters)")
    end

    it "パスワードと確認が一致していないと登録できないこと" do
      user = build(:user, password_confirmation: "")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it "登録済みのemailアドレスでは登録できないこと" do
      email = Faker::Internet.email
      user = create(:user, email: email)
      user2 = build(:user, email: email)
      user2.valid?
      expect(user2.errors[:email]).to include("has already been taken")
    end

  end
end