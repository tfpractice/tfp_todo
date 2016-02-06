require 'rails_helper'

RSpec.describe User, type: :model do

	let(:user) { build(:user)  }
  it 'has a username' do
  	expect(user.username).to be_a(String)
  end

  it 'has an email address' do
  	expect(user.email).to be_a(String)
  end
  it 'has a password' do
  	expect(user.password).to be_a(String)
  end


end
