require 'rails_helper'

RSpec.describe "tasks/edit", type: :view do
  before(:each) do
    @task = assign(:task, Task.create!(
      :title => "MyString",
      :content => "MyText",
      :list => nil
    ))
  end

  it "renders the edit task form" do
    render

    assert_select "form[action=?][method=?]", task_path(@task), "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_content[name=?]", "task[content]"

      assert_select "input#task_list_id[name=?]", "task[list_id]"
    end
  end
end
