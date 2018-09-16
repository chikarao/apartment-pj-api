class CreateCalendars < ActiveRecord::Migration[5.1]
  def change
    create_table :calendars do |t|
      t.string :ical_url
      t.references :flat, foreign_key: true
      t.string :name
      t.datetime :last_updated_calendar

      t.timestamps
    end
  end
end
