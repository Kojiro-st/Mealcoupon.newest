require 'rails_helper'

describe Message do
  describe '#create' do
    it "nameがないと登録できないこと" do
      message = build(:message, name: nil)
      message.valid?
      expect(message.errors[:name]).to include("can't be blank")
    end

    it "phonenumberがないと登録できないこと" do
      message = build(:message, phonenumber: nil)
      message.valid?
      expect(message.errors[:phonenumber]).to include("can't be blank")
    end

    it "ordertimeleftがないと登録できないこと" do
      message = build(:message, ordertimeleft: nil)
      message.valid?
      expect(message.errors[:ordertimeleft]).to include("can't be blank")
    end

    it "ordertimerightがないと登録できないこと" do
      message = build(:message, ordertimeright: nil)
      message.valid?
      expect(message.errors[:ordertimeright]).to include("can't be blank")
    end

    it "howtoeatがないと登録できないこと" do
      message = build(:message, howtoeat: nil)
      message.valid?
      expect(message.errors[:howtoeat]).to include("can't be blank")
    end

    it "peopleがないと登録できないこと" do
      message = build(:message, people: nil)
      message.valid?
      expect(message.errors[:people]).to include("can't be blank")
    end

  end
end