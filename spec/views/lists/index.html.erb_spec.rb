require 'rails_helper'

RSpec.describe "lists/index", type: :view do
   let(:user) { create(:user) }
  let(:list) { create(:list, user: user) }
  let(:tasks) { list.tasks.all }
  before(:each) do
    assign(:lists, [
      user.lists.create!(
        :title => "Title",
        :description => "Description",
        # :user => nil
      ),
      user.lists.create!(
        :title => "Title",
        :description => "Description",
        # :user => nil
      )
    ])
  end

  it "renders a list of lists" do
    render
    
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
    assert_select "tr>td", :text => nil.to_s, :count => 2
  end
end
