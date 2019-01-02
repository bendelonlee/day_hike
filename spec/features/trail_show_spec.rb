require "rails_helper"
describe 'trail show page' do
  it "shows names and address of the trail, as well as its trips' names and total distances" do
    trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
    trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
    trail_3 = Trail.create!(name: "Easiest Trip", address: "808 W Mut Drive", length: 1)
    trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)
    trip_2 = Trip.create!(name: "Easy Trip", trails: [trail_3, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)
    trip_3= Trip.create!(name: "Hard Trip", trails: [trail_1], start_date: 200.days.ago, end_date: 10.days.ago)
    visit trail_path(trail_2)

    expect(page).to have_content(trail_2.name)
    expect(page).to have_content(trail_2.address)
    expect(page).to have_content("Total Trips Where This Trail Was Included: 2")

    expect(page).to have_content(trip_1.name)
    expect(page).to have_content(trip_1.total_distance)
    expect(page).to have_content(trip_2.name)
    expect(page).to have_content(trip_2.total_distance)
    expect(page).to_not have_content(trip_3.name)

  end
end
