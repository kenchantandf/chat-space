require 'rails_helper'

describe MessagesController, type: :controller do
  let(:user) { create(:user) }
  let(:group) { create(:group) }
  let(:message) { create(:message, user_id: user.id, group_id: group.id) }
  let(:messages) { create_list(:message, 3, user: user, group: group )}

  describe 'GET #index' do

    before do
      login_user user
      get :index, group_id: group
    end

    it "populates an array of messages" do
      expect(assigns(:messages)).to match(messages)
    end

    it "assigns requested contact to @group" do
      expect(assigns(:group)).to eq group
    end

    it "renders the :index template" do
      expect(response).to render_template :index
    end
  end

  describe 'POST #create' do

    it "saves the new message in the database" do
      expect(message).to be_valid
    end

    it "does not save the new contact in the database" do
      message = build(:message, text: nil)
      message.valid?
      expect(message.errors[:text]).to include("を入力してください。")
    end
  end
end
