class Event < ApplicationRecord
  belongs_to :organiser
  validates :title, presence: true
  validates :location, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  validates :special, presence: true
  validates :dresscode, presence: true
  serialize :recurring, type: Hash, coder: YAML

  def schedule
    schedule = IceCube::Schedule.new(start_time)
    schedule.add_recurrence_rule(IceCube::Rule.from_hash(recurrence)) if recurrence.present?
    schedule
  end

  def ocurrences_between(start_date, end_date)
    schedule.ocurrences_between(start_date, end_date)
  end
end
