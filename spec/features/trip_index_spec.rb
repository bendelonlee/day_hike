require "rails_helper"

describe 'as a visitor' do
  it 'I see all trip names' do
    trip_1 = Trip.create!(name: "The Long one", start_date: 200.days.ago, end_date: 10.days.ago)
    trip_2 = Trip.create!(name: "The Longer one", start_date: 400.days.ago, end_date: 10.days.ago)
    visit trips_path
    within "#trip-#{trip_1.id}" do
      expect(page).to have_content(trip_1.name)
    end
    within "#trip-#{trip_2.id}" do
      expect(page).to have_content(trip_2.name)
      click_on(trip_2.name)
    end
    expect(current_path).to eq(trip_path(trip_2))

  end

end
