class Task < ActiveRecord::Base
  belongs_to :list
  validates_presence_of :title
  before_create :set_incomplete


private
  def set_incomplete
    self.completed_on = nil
  end

end
