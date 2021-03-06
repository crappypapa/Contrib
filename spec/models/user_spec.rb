require 'rails_helper'

RSpec.describe User, type: :model do
  let(:user) { User.create(username: 'Olaoluwa') }
  let(:invalid_user) { User.create(username: '') }
  let(:contributions) { User.reflect_on_association(:contributions).macro }
  let(:groups) { User.reflect_on_association(:groups).macro }

  it 'checks for the  user validity' do
    @user = User.create(username: 'shaher')
    expect(@user).to be_valid
  end

  it 'user username should not be empty' do
    expect(invalid_user).to_not be_valid
  end

  it 'checks for correct user association' do
    expect(contributions).to eq(:has_many)
  end

  it 'check for the correct user association' do
    expect(groups).to eq(:has_many)
  end
end
