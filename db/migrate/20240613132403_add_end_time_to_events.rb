class AddEndTimeToEvents < ActiveRecord::Migration[7.1]
  def change
    add_column :events, :end_time, :date
  end
end
