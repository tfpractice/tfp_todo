require 'rails_helper'

RSpec.describe List, type: :model do


  context 'attributes' do
  	let(:user) {build(:user)  }
  	let(:list) { build(:list) }
    
    it 'has a title attribute' do
     
      expect(list.title).to be_a(String)


    end
    it 'has a description attribute' do
     
      expect(list.description).to be_a(String)


    end
    it 'has a user attribute' do
     
      expect(list.user).to be_a(User)


    end
  end

end
