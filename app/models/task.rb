class Task < ActiveRecord::Base
  include PublicActivity::Common
  belongs_to :list
  before_create :set_incomplete
  validates_presence_of :title

   




  scope :complete, lambda { where.not(completed_on: nil) }
  scope :started, lambda { where.not(start_date: nil) }
  scope :notcomplete, lambda { where(completed_on: nil) }
  scope :pending, lambda {  where(start_date: nil, completed_on: nil)}
  scope :pastdue, lambda {  where("due_date < ?", DateTime.now) }

  def begin
    self.update_attribute(:start_date, DateTime.now)
  end

  def complete
    if !started?
      self.begin
    end
    self.update_attribute(:completed_on, DateTime.now)

  end

  def started?
    !start_date.blank?
  end


  def completed?
    !completed_on.blank?
  end
  def hasDate?
    !due_date.blank?
  end
  def pastdue?
    if hasDate? 
      return due_date < DateTime.now
    else
      return false
    end

  end
  def pending?
    if (!started? && !completed? )
      return true
      
    else
      return false
    end
  end
   def overdue?
     if (!completed? && pastdue?)
       true
     else
       false
     end
   end

  def in_progress?
    if  self.started?  && !self.completed?
      return true
    else
      return false
    end
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
