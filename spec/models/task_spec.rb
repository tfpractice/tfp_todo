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
        # puts task.inspect
        expect(task.attributes).to include("start_date")
      end

      it 'has an initial nil start_date' do
        expect(task.start_date).to be_nil
      end

    end
    describe '#begin' do
      it 'changes start_date to now' do
        @bgTask = create(:task)
        @bgTask.begin
        expect(@bgTask.start_date).not_to be_nil
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
    describe 'statuses' do
      #
      before(:each) do
        # @ipTask = create(:task)
        @ipTask = create(:task, completed_on: nil)
      end
      describe 'started?' do
        it 'responds to started?' do
          expect(@ipTask).to respond_to(:started?)

        end
        context 'before begin' do
          it 'started will return false' do
            expect(@ipTask.started?).to be false


          end

        end
        context 'after begin' do
          it 'started? returns true' do
            @ipTask.begin
            expect(@ipTask.started?).to be true

          end
        end


      end
      describe 'completed?' do
        it 'checks completed_on attribute' do
          # puts @ipTask.attributes
          expect(@ipTask.completed_on).to be nil

        end
        it 'returns false if completed_on is nil' do
          expect(@ipTask.completed?).to be false

        end


      end
      describe 'complete' do

        it 'sets completed_on attribute' do
          @ipTask.complete
          # puts @ipTask.attributes

          expect(@ipTask.completed_on).not_to be nil

        end
        it 'sets completed_on attribute' do
          @ipTask.complete

          expect(@ipTask.completed?).to be true

        end
      end
      describe 'hasDate?' do
        before(:all) do
          @undueTask = create(:task, due_date: nil)
        end
        it 'checks for due_date blankness' do
          expect(@undueTask.due_date).to be nil
        end
        it 'returns false if due_date is blank' do
          expect(@undueTask.hasDate?).to be false


        end
        it 'returns true when due_date is set' do
          @undueTask.due_date = DateTime.now
          expect(@undueTask.hasDate?).to be true

        end
        describe 'pastdue?' do
          it 'returns false when due_date is in the future' do
            @undueTask.due_date = DateTime.tomorrow
            expect(@undueTask.pastdue?).to be false

          end
          it 'returns true when due_date is in the past' do
            @undueTask.due_date = DateTime.yesterday
            expect(@undueTask.pastdue?).to be true

          end
          describe 'overdue' do
            context 'a task is pastdue and not completed' do
              it 'returns true' do
                @undueTask.due_date = DateTime.yesterday
                @undueTask.completed_on = nil
                expect(@undueTask.overdue?).to be true
              end

            end
            context 'a task is past due but already completed' do
              it 'returns false' do
                @undueTask.due_date = DateTime.yesterday
                @undueTask.complete
                expect(@undueTask.overdue?).to be false

              end
            end

          end


        end

      end


      it 'has a  start_date ' do


      end
      # end

    end
  end
end
