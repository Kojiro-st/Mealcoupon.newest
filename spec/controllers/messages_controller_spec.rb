require 'rails_helper'

describe MessagesController, type: :controller do
  describe 'GET #index' do
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end