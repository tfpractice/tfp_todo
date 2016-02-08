require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'attributes' do
    let(:list) { create(:list) }
    let(:task) { build_stubbed(:task, list: list)  }


    it 'has a title' do
      expect(task.title).to be_a(String)
    end
    it 'has a content attribute' do
      expect(task.content).to be_a(String)


    end
    it 'has a list attribute' do
      expect(task.list).to be_a(List)

    end

    describe '#set_incomplete' do
      describe 'when given new task with completed_on set' do
        it 'has a nil completed_on attribute on build' do
          # newTask = build(:task, list: list)
          newTask = list.tasks.build attributes_for(:task)
          puts newTask.inspect
          expect(newTask.completed_on).not_to be_nil

        end
        it ' nullifies completed_on attribute before save' do
          # newTask = build(:task, list: list)
          newTask = list.tasks.create! attributes_for(:task)
          puts newTask.inspect
          expect(newTask.completed_on).to be_nil

        end
      end


    end

  end
end
