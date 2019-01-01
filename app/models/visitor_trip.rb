class VisitorTrip < ApplicationRecord
  belongs_to :trip
  belongs_to :visitor
end
