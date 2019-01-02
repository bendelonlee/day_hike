require 'rails_helper'

describe Trail, type: :model do
  describe 'validations' do
    it { should validate_presence_of :length }
    it { should validate_presence_of :name }
    it { should validate_presence_of :address }

    it { should validate_numericality_of(:length).only_integer }
    it { should validate_numericality_of(:length).is_greater_than(0) }

    it { should have_many :trip_trails}
    it { should have_many :trips }
  end

  describe 'instance methods' do
    it '.total_trips' do
      trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
      trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
      trail_3 = Trail.create!(name: "Easiest Trip", address: "808 W Mut Drive", length: 1)
      trail_4 = Trail.create!(name: "Easiest Trip", address: "808 W Mut Drive", length: 1)
      trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)
      trip_2 = Trip.create!(name: "Easy Trip", trails: [trail_3, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)
      trip_3 = Trip.create!(name: "Hard Trip", trails: [trail_1], start_date: 200.days.ago, end_date: 10.days.ago)

      expect(trail_1.total_trips).to eq(2)
      expect(trail_3.total_trips).to eq(1)
      expect(trail_4.total_trips).to eq(0)
    end
  end
end
