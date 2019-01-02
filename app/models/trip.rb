class Trip < ApplicationRecord
  validates_presence_of :name, :start_date, :end_date
  has_many :trip_trails
  has_many :trails, through: :trip_trails
  has_many :visitor_trips
  has_many :visitors, through: :visitor_trips

  def total_distance
    trails.sum(:length)
  end

  def average_length
    trails.average(:length)
  end

  def longest_trail
    trails.order(length: :desc).limit(1)[0]
  end

  def shortest_trail
    trails.order(length: :asc).limit(1)[0]
  end
end
