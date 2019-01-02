require "rails_helper"
RSpec.describe Trip, type: :model do
 it { should validate_presence_of :name }
 it { should validate_presence_of :start_date }
 it { should validate_presence_of :end_date }
 it { should have_many :trip_trails }
 it { should have_many :trails }
 it { should have_many :visitor_trips }
 it { should have_many :visitors }

 describe 'instance methods' do
   it '.total_distance' do
     trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
     trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
     trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)

     expect(trip_1.total_distance).to eq(110)
   end

   it '.total_distance' do
     trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
     trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
     trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)

     expect(trip_1.average_length).to eq(55)
   end

   it '.longest_trail' do
     trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
     trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
     trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)

     expect(trip_1.longest_trail).to eq(trail_1)

   end

   it '.shortest_trail' do
     trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
     trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
     trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)

     expect(trip_1.shortest_trail).to eq(trail_2)

   end
 end
end
