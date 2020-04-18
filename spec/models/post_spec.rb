require 'rails_helper'

describe Post do
  describe '#create' do
    context 'postを保存できない場合' do
      it "couponcodeがない場合は登録できないこと" do
        post = build(:post, couponcode: "")
        post.valid?
        expect(post.errors[:couponcode]).to include("can't be blank")
      end
      it "shopnameがない場合は登録できないこと" do
        post = build(:post, shopname: "")
        post.valid?
        expect(post.errors[:shopname]).to include("can't be blank")
      end
      it "addressがない場合は登録できないこと" do
        post = build(:post, address: "")
        post.valid?
        expect(post.errors[:address]).to include("can't be blank")
      end
      it "expirydateがない場合は登録できないこと" do
        post = build(:post, expirydate: "")
        post.valid?
        expect(post.errors[:expirydate]).to include("can't be blank")
      end
      it "foodnameがない場合は登録できないこと" do
        post = build(:post, foodname: "")
        post.valid?
        expect(post.errors[:foodname]).to include("can't be blank")
      end
    end

    context 'postを保存できる場合' do
      it 'imageとcouponcodeとshopnameとaddressとexpirydateとfoodnameがあれば保存できること' do
        expect(build(:post, prefecture: "", foodvariety: "")).to be_valid
      end
    end
  end
end