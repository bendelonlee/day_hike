require "rails_helper"
RSpec.describe Trip, type: :model do
 it { should validate_presence_of :name }
 it { should validate_presence_of :start_date }
 it { should validate_presence_of :end_date }
 it { should have_many :trip_trails }
 it { should have_many :trails }
 it { should have_many :visitor_trips }
 it { should have_many :visitors }
end
