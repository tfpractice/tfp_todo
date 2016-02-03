require 'rails_helper'

RSpec.describe "tasks/new", type: :view do
  before(:each) do
    assign(:task, Task.new(
      :title => "MyString",
      :content => "MyText",
      :list => nil
    ))
  end

  it "renders new task form" do
    render

    assert_select "form[action=?][method=?]", tasks_path, "post" do

      assert_select "input#task_title[name=?]", "task[title]"

      assert_select "textarea#task_content[name=?]", "task[content]"

      assert_select "input#task_list_id[name=?]", "task[list_id]"
    end
  end
end
