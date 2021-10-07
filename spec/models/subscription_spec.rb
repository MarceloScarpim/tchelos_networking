require 'rails_helper'

RSpec.describe Subscription, type: :model do
  it 'user can follow another user' do
    marcelo = FactoryBot.build(:user)
    ka = FactoryBot.build(:user)

    Subscription.create(followed: marcelo, followed_by: ka)

    # testa se o usuario marcelo está sendo seguido
    expect(marcelo.followers.count).to eql 1
    expect(marcelo.followers).to include ka

    # testa se o usuario ka está seguindo alguem 
    expect(ka.following.count).to eql 1
    expect(ka.following).to include marcelo

    # testa se o usuario marcelo não segue ngm
    expect(marcelo.following.count).to eql 0
    expect(marcelo.following).to_not include ka

    # testa se o usuario ka não tem seguidor
    expect(ka.followers.count).to eql 0
    expect(ka.followers).to_not include marcelo

    jose = FactoryBot.build(:user)

    Subscription.create(followed: marcelo, followed_by: jose)

    expect(marcelo.followers.count).to eql 2
    expect(marcelo.followers).to include jose

    expect(jose.following.count).to eql 1
    expect(jose.following).to include marcelo

  end
end
