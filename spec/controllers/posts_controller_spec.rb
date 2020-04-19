require 'rails_helper'

describe PostsController, type: :controller do
  describe 'GET #new' do
    it "new.html.hamlに遷移すること" do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'GET #edit' do
    it "@postに正しい値が入っていること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "edit.html.hamlに遷移すること" do
      post = create(:post)
      get :edit, params: { id: post }
      expect(response).to render_template :edit
    end
  end

  describe 'GET #index' do
    it "@postsに正しい値が入っていること" do
      posts = create_list(:post, 3) 
      get :index
      expect(assigns(:posts)).to match(posts.sort{ |a, b| b.created_at <=> a.created_at } )
    end
    it "index.html.hamlに遷移すること" do
      get :index
      expect(response).to render_template :index
    end
  end

  describe 'GET #show' do
    it "@postsに正しい値が入っていること" do
      post = create(:post)
      get :show, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "show.html.hamlに遷移すること" do
      get :show, params: {  id: 1 }
      expect(response).to render_template :show
    end
  end

  describe 'GET #map' do
    it "map.html.hamlに遷移すること" do
      get :map
      expect(response).to render_template :map
    end
  end

  describe 'GET #tag' do
    it "@postsに正しい値が入っていること" do
      # post = Post.create(couponcode: "00", shopname: "00", address: "00000000", expirydate: "00000000", foodname: "000", prefecture: "東京", foodvariety: "寿司")
      get :tag, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "tag.html.hamlに遷移すること" do
      post = create(:post)
      get :tag, params: { id: post }
      expect(response).to render_template :tag
    end
  end

  describe 'GET #find' do
    it "@postsに正しい値が入っていること" do
      # post = Post.create(couponcode: "00", shopname: "00", address: "00000000", expirydate: "00000000", foodname: "000", prefecture: "東京", foodvariety: "寿司")
      get :find, params: { id: post }
      expect(assigns(:post)).to eq post
    end
    it "find.html.hamlに遷移すること" do
      post = create(:post)
      get :find, params: { id: 1 }
      expect(response).to render_template :find
    end
  end

  describe 'POST #create' do
    it "@postがデータベースに保存されていること" do
      expect{
        post :create, post: attributes_for(:post)
      }.to change(Post, :count).by(1)
    end
    it "posts#indexにリダイレクトすること" do
      post :create, post: attributes_for(:post)
      expect(response).to redirect_to posts_path
    end
  end

  describe 'PATCH #update' do
    it "@postの改善リクエストがあること" do
      post = create(:post)
      patch :update, id: post, post: attributes_for(:post)
      expect(assigns(:post)).to eq post
    end

    it "@postが改善されること" do
      post = create(:post)
      patch :update, id: post, post: attributes_for(:post, image: '000', couponcode: '000', shopname: '000', address: '000', expirydate: '000', foodname: '000', prefecure: '沖縄', foodvariety: 'ビアガーデン')
      post.reload
      expect(post.image).to eq("hoge")
      expect(post.couponcode).to eq("hogehoge")
      expect(post.shopname).to eq("hogehoge")
      expect(post.address).to eq("hogehoge")
      expect(post.expirydate).to eq("hogehoge")
      expect(post.foodname).to eq("hogehoge")
      expect(post.prefecture).to eq("北海道")
      expect(post.foodvariety).to eq("イタリアン")
    end

    it "posts_pathにリダイレクトすること" do
      post = create(:post)
      patch :update, id: post, post: attributes_for(:post)
      expect(response).to redirect_to posts_path
    end
  end

  describe 'delete #destroy' do
    it "@postを消去すること" do
      post = create(:post)
      expect{
        delete :destroy, id: post
      }.to change(Post,:count).by(-1)
    end
  end

end