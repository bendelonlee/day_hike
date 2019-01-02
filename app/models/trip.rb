class Trip < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date
  has_many :trip_trails
  has_many :trails, through: :trip_trails
  has_many :visitor_trips
  has_many :visitors, through: :visitor_trips

  def total_distance
    trails.sum(:length)
  end
end
