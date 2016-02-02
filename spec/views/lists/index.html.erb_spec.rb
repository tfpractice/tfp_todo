require 'rails_helper'

RSpec.describe "lists/index", type: :view do
  before(:each) do
    assign(:lists, [
      List.create!(
        :title => "Title",
        :description => "Description",
        :user => nil
      ),
      List.create!(
        :title => "Title",
        :description => "Description",
        :user => nil
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
