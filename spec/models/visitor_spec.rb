require "rails_helper"
RSpec.describe Visitor do
  it { should validate_presence_of :name }
  it { should have_many :visitor_trips }
  it { should have_many :trips }
end
