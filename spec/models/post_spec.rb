require 'rails_helper'

describe Post do
  describe '#create' do
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
end