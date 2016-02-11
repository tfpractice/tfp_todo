require 'rails_helper'

RSpec.describe Task, type: :model do
  context 'attributes' do
    let(:list) { create(:list) }
    let(:task) { build_stubbed(:task, list: list)  }
    let(:dbTask) { create(:task, list: list)  }


    it 'has a title' do
      expect(task.title).to be_a(String)
    end
    it 'has a content attribute' do
      expect(task.content).to be_a(String)


    end
    it 'has a list attribute' do
      expect(task.list).to be_a(List)

    end
    describe 'start_date' do
      it 'has a start_date' do
        puts task.inspect
        expect(task.attributes).to include("start_date")
      end

      it 'has an initial nil start_date' do
        expect(task.start_date).to be_nil
      end

    end
    describe '#begin' do
      it 'changes start_date to now' do
        task.begin
        expect(task.start_date).not_to be_nil 
      end
      
    end

    describe '#set_incomplete' do
      context 'when given new task with completed_on set' do
        it 'has a nil completed_on attribute on build' do
          # newTask = build(:task, list: list)
          newTask = list.tasks.build attributes_for(:task)
          # puts newTask.inspect
          expect(newTask.completed_on).not_to be_nil

        end
        it ' nullifies completed_on attribute before save' do
          # newTask = build(:task, list: list)
          newTask = list.tasks.create! attributes_for(:task)
          # puts newTask.inspect
          expect(newTask.completed_on).to be_nil

        end
      end
    end

  end
end
