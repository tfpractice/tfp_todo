require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'attributes' do
    before :each do
      @list = create(:list)
      @task = build(:task)

    end

    it 'has a title' do
      expect(@task.title).to be_a(String)
    end
    it 'has a content attribute' do
      expect(@task.content).to be_a(String)


    end
    it 'has a list attribute' do
      expect(@task.list).to be_a(List)

    end
  end
end
