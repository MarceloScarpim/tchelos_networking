require 'rails_helper'

RSpec.describe Comment, type: :model do
  it 'user comments on a post' do
    ma = FactoryBot.create(:user)
    ka = FactoryBot.create(:user)

    post = FactoryBot.create(:post, user: ma)

    comment = FactoryBot.create(:comment, user: ka, post: post)

    expect(post.comments.count).to eql 1
    expect(post.comments.first.user).to eql ka

    expect(post.comments.first.body).to eql "Comentário aleatório"
    expect(ka.comments.first).to eql comment
  end
end
