require 'rails_helper'

RSpec.describe Like, type: :model do
  it 'user likes a post' do

    marcelo = FactoryBot.build(:user)
    ka = FactoryBot.build(:user)
    jose = FactoryBot.build(:user)

    post = FactoryBot.create(:post, user: marcelo)

    Like.create(user: ka, post: post)

    expect(post.likes.count).to eql 1
    expect(post.likes.first.user).to eql ka

    Like.create(user: jose, post: post)
    expect(post.likes.count).to eql 2
    expect(post.likes.last.user).to eql jose

    Like.find_by(user: jose, post: post).destroy
    expect(post.likes.count).to eql 1
    expect(post.likes.last.user).to eql ka
  end
end
