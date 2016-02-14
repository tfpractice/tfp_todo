require 'rails_helper'

# Specs in this file have access to a helper object that includes
# the ListsHelper. For example:
#
# describe ListsHelper do
#   describe "string concat" do
#     it "concats two strings with spaces" do
#       expect(helper.concat_strings("this","that")).to eq("this that")
#     end
#   end
# end
RSpec.describe ListsHelper, type: :helper do


	let(:list) { create(:list) }

	describe 'getNewListTask' do
	  it 'returns a new task associated with the current list' do
	  	expect(helper.getNewListTask(list)).to be_a_kind_of(Task)
	  	
	  end
	end
end
