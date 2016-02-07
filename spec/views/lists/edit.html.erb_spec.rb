require 'rails_helper'

RSpec.describe "lists/edit", type: :view do
  let(:user) { create(:user) }
  before(:each) do

    @list = assign(:list, user.lists.create!(
      :title => "MyString",
      :description => "MyString",
      :user => user
    ))
  end

  it "renders the edit list form" do
    render

    assert_select "form[action=?][method=?]", list_path(@list), "post" do

      assert_select "input#list_title[name=?]", "list[title]"

      assert_select "input#list_description[name=?]", "list[description]"

      assert_select "input#list_user_id[name=?]", "list[user_id]"
    end
  end
end
