require 'rails_helper'

RSpec.describe Post, type: :model do
  it 'post is not valid' do
    # @post = User.new(
    #   body: 'Marcelo',      
    # )

    post = FactoryBot.build(:post)

    expect(post).to_not be_valid
  end

  it 'post is valid' do
    # @post = User.new(
    #   body: 'Marcelo',      
    # )

    post = FactoryBot.build(:post)
    post.user = FactoryBot.build(:user)
    post.save

    expect(post).to be_valid
  end


  it 'post belongs to user' do
    # @post = User.new(
    #   body: 'Marcelo',      
    # )
    user = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: user)


    expect(post.user).to eql user
  end

  it 'user has many posts' do    
    user = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: user)


    expect(user.posts).to include post
  end
end
