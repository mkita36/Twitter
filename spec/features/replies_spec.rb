require 'rails_helper'

RSpec.feature 'リプライ（JavaScript）', type: :feature do
  before do
    @user = FactoryBot.create(:user)
    @other_user = FactoryBot.create(:user)
    @profile = FactoryBot.create(:profile, user: @user)
    @other_profile = FactoryBot.create(:profile, user: @other_user)
    @tweet = FactoryBot.create(:tweet, user: @other_user)
    sign_in @user
  end
  scenario 'リプライする', js: true do
    visit tweet_path(@tweet)
    fill_in 'reply[comment]', with: '初めてのリプライです。'
    expect{
    click_button 'commit'
    expect(page).to have_content 'Tweet'
    }.to change(@user.replies, :count).by(1)
  end
end
