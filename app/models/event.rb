class Event < ApplicationRecord
  belongs_to :organiser
  validates :title, presence: true
  validates :location, presence: true
  validates :special, presence: true
  validates :dresscode, presence: true
  validates :recurrence, presence: true
  serialize :recurrence, coder: Montrose::Recurrence
end
