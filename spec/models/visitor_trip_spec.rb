require "rails_helper"
describe VisitorTrip do
  it {should belong_to :visitor }
  it {should belong_to :trip }
end
