require 'rails_helper'

RSpec.describe 'posts#show', type: :feature do
  before do
    @user1 = User.create(name: 'Bilal Liaquat', photo: 'photo_url1', bio: 'I am a software developer.', postsCounter: 1)
    @user2 = User.create(name: 'Chris', photo: 'photo_url2', bio: 'Engineer', postsCounter: 0)
    @post1 = Post.create(author: @user1, title: 'Hello', text: 'Good.', commentssCounter: 0, likesCounter: 0)
    @comment1 = Comment.create(user: @user2, post: @post1, text: 'Great work Benjamin')
    @like1 = Like.create(user: @user2, post: @post1)
  end

  scenario 'display the post title' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.title)
  end

  scenario 'display the person who wrote the post' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.author.name)
  end

  scenario 'display the post body' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.text)
  end

  scenario 'display how many comments a post has' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content("Comments: #{@post1.commentssCounter}")
  end

  scenario 'display how many likes a post has' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content("Likes: #{@post1.likesCounter}")
  end

  scenario 'display the username of each commentor' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.comments[0].user.name)
  end

  scenario 'display the comment of each commentor' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content(@post1.comments[0].text)
  end

  scenario 'display comment button' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_button('Comment')
  end

  scenario 'display like button' do
    visit user_post_path(@user1, @post1)
    expect(page).to have_content('Like')
  end

  scenario 'clicking on a comment button redirects to the comment new page' do
    visit user_post_path(@user1, @post1)
    click_link('Comment')
    expect(current_path).to eq(new_post_comment_path(post_id: @user1.posts[0].id))
  end

  scenario 'clicking on a like button redirects to the like create page' do
    visit user_post_path(@user1, @post1)
    click_button('Like')
    expect(current_path).to eq(post_likes_path(@post1.id))
  end

  scenario 'pagination section is visible when there are more posts than fit on the view' do
    visit posts_path
    initial_post_count = page.all('.post').count
    visit current_path
    updated_post_count = page.all('.post').count

    if updated_post_count > initial_post_count
      expect(page).to have_selector('.pagination', visible: true)
    else
      expect(page).not_to have_selector('.pagination')
    end
  end
end
