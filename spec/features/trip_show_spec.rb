require "rails_helper"
describe 'the trip show page' do
  it 'shows the trails of the trip including the name, address, length of the trail' do
    trail_1 = Trail.create!(name: "Hard Trip", address: "808 W Buddha Drive", length: 100)
    trail_2 = Trail.create!(name: "Easy Trip", address: "808 W Mu Drive", length: 10)
    trip_1 = Trip.create!(name: "Mixed Trip", trails: [trail_1, trail_2], start_date: 200.days.ago, end_date: 10.days.ago)
    visit trip_path(trip_1)
    expect(page).to have_content(trip_1.name)
    expect(page).to have_content("Total Distance: 110")
    expect(page).to have_content("Average Trail Length: 55")
    within "#longest-trail" do
      expect(page).to have_content("Longest Trail on Trip: #{trail_1.name}")
      expect(page).to have_content("#{trail_1.length} miles")
      expect(page).to have_link(trail_1.name, href: trail_path(trail_1))
    end
    within "#shortest-trail" do
      expect(page).to have_content("Shortest Trail on Trip: #{trail_2.name}")
      expect(page).to have_content("#{trail_2.length} miles")
      expect(page).to have_link(trail_2.name, href: trail_path(trail_2))

    end
    within "#trail-#{trail_1.id}" do
      expect(page).to have_content(trail_1.name)
      expect(page).to have_link(trail_1.name, href: trail_path(trail_1))
      expect(page).to have_content(trail_1.address)
      expect(page).to have_content("#{trail_1.length} miles")
    end
    within "#trail-#{trail_2.id}" do
      expect(page).to have_content(trail_2.name)
      expect(page).to have_link(trail_2.name, href: trail_path(trail_2))

      expect(page).to have_content(trail_2.address)
      expect(page).to have_content("#{trail_2.length} miles")
    end
  end


end
