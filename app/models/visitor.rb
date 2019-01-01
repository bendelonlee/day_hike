class Visitor < ApplicationRecord
  validates_presence_of :name
  has_many :visitor_trips
  has_many :trips, through: :visitor_trips
end
