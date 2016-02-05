require 'rails_helper'

RSpec.describe User, type: :model do
  it 'has a username' do
  	user = build(:user)
  	expect(user.username).to be_a(String)
  end

  it 'has an email address' do
  	user = build(:user)
  	expect(user.email).to be_a(String)
  end
  it 'has a password' do
  	user = build(:user)
  	expect(user.password).to be_a(String)
  end


end
