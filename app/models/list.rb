class List < ActiveRecord::Base
  validates_presence_of :title
  belongs_to :user
  delegate :username, to: :user
  has_many :tasks
  accepts_nested_attributes_for :tasks, reject_if: :all_blank, allow_destroy: true

end
