require 'rails_helper'

RSpec.describe "Tasks", type: :request do
	let(:list) { create(:list) }
  describe "GET /tasks" do
    it "works! (now write some real specs)" do
      get list_tasks_path(list), list_id: list
      expect(response).to have_http_status(200)
    end
  end
end
