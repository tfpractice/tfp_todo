class List < ActiveRecord::Base
  include PublicActivity::Common
  validates_presence_of :title
  belongs_to :user
  delegate :username, to: :user
  has_many :tasks, dependent: :destroy
  accepts_nested_attributes_for :tasks, allow_destroy: true, reject_if: proc { |attributes| attributes['title'].blank? }

end
