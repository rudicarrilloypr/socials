require 'rails_helper'

RSpec.feature 'User Show', type: :feature do
  let(:user) { create(:user) }
  let!(:first_post) { create(:post, author: user) }

  before do
    visit user_path(user)
  end

  scenario "viewing a user's details" do
    expect(page).to have_content(user.name)
    # Update to match the actual image source
    expect(page).to have_selector("img[src$='path_to_default_profile_pic.jpg']")
    expect(page).to have_content(user.bio) if user.bio
    expect(page).to have_content("#{user.posts.count} posts")
    user.posts.limit(3).each do |post|
      expect(page).to have_content(post.title)
      # Comment out if the post model doesn't have a body attribute
      # expect(page).to have_content(post.body.truncate(100))
    end
  end

  scenario 'clicking on a post redirects to post show page' do
    click_on first_post.title
    expect(current_path).to eq(user_post_path(user, first_post))
  end

  scenario 'clicking the view all posts button' do
    click_on 'All posts'
    expect(current_path).to eq(user_posts_path(user))
  end
end
