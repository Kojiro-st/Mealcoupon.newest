require 'rails_helper'

describe MessagesController do
  describe 'GET #index' do
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end
end