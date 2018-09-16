class CalendarSerializer < ActiveModel::Serializer
  attributes :id, :flat_id, :name, :ical_url, :last_updated_calendar

  belongs_to :flat
end
