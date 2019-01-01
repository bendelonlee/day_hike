class CreateVisitorTrips < ActiveRecord::Migration[5.1]
  def change
    create_table :visitor_trips do |t|
      t.references :trip, foreign_key: true
      t.references :visitor, foreign_key: true
    end
  end
end
