class CreateEvents < ActiveRecord::Migration[7.1]
  def change
    create_table :events do |t|
      t.text :title
      t.text :location
      t.text :recurrence
      t.text :line_up
      t.text :style
      t.text :special
      t.text :dresscode
      t.references :organiser, null: false, foreign_key: true

      t.timestamps
    end
  end
end
