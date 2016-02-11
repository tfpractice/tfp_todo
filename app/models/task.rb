class Task < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :list
  validates_presence_of :title
  before_create :set_incomplete

  scope :complete, lambda { where.not(completed_on: nil) }
  scope :incomplete, lambda { where(completed_on: nil) }


private
  def set_incomplete
    self.completed_on = nil
  end

end
