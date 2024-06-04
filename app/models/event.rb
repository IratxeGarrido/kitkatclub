class Event < ApplicationRecord
  belongs_to :organiser
  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :special, presence: true
  validates :dresscode, presence: true
end
