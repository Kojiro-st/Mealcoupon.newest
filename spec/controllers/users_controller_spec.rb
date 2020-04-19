require 'rails_helper'

describe UsersController, type: :controller do
  describe 'GET #show' do
    it "@userに正しい値が入っていること" do
      user = create(:user)
      get :show, params: { id: user }
      expect(assigns(:user)).to eq user
    end
    it "@postsに正しい値が入っていること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "show.html.hamlに遷移すること" do
      get :show, params: {  id: 1 }
    end
  end
end