require 'rails_helper'

feature 'post', type: :feature do
  let(:user) { create(:user) }

  scenario 'ユーザー情報が更新されていること' do

    visit root_path
    visit posts_path
    expect(page).to have_no_content('新規投稿')

    # ログイン処理
    visit new_user_session_path
    fill_in 'user_email', with: user.email
    fill_in 'user_password', with: user.password
    find('input[name="commit"]').click
    expect(current_path).to eq posts_path
    expect(page).to have_content('新規投稿')

    # ツイートの投稿
    expect {
      visit posts_path
      click_link('新規投稿')
      expect(current_path).to eq new_post_path
      fill_in 'image', with: 'https://s.eximg.jp/expub/feed/Papimami/2016/Papimami_83279/Papimami_83279_1.png'
      fill_in 'couponcode', with: '無料'
      fill_in 'shopname', with: '鯛焼き屋'
      fill_in 'address', with: '日本'
      fill_in 'expirydate', with: '今日'
      fill_in 'foodname', with: '美味しい食べ物'
      find('input[type="submit"]').click
    }.to change(Post, :count).by(1)
  end
end