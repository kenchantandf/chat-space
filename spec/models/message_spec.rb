require 'rails_helper'

describe Message, type: :model do
  describe 'sending a message' do

    it "is valid with a text" do
      message = build(:message)
      expect(message).to be_valid
    end

    it "is invalid without a text" do
      message = build(:message, text: "")
      message.valid?
      expect(message.errors[:text]).to include("を入力してください")
    end
  end
end
