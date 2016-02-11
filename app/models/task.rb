class Task < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :list
  validates_presence_of :title
  before_create :set_incomplete




  scope :complete, lambda { where.not(completed_on: nil) }
  scope :started, lambda { where.not(start_date: nil) }
  # scope :incomplete, lambda { where("completed_on = ? AND start_date < ?", nil,  DateTime.now) }
  scope :notcomplete, lambda { where(completed_on: nil) }
  scope :pending, lambda {  where(start_date: nil, completed_on: nil)}
  scope :pastdue, lambda {  where("due_date < ?", DateTime.now) }

  def begin
    self.update_attribute(:start_date, DateTime.now)
  end

  def complete
    # self.completed_on = DateTime.now
    self.update_attribute(:completed_on, DateTime.now)

  end

  def self.overdue
    notcomplete.pastdue
  end

  def self.in_progress
    notcomplete.started
  end

  private
  
  def set_incomplete
    self.completed_on = nil
  end

end
