class AddTableForStateReports < ActiveRecord::Migration[6.0]
  def change
    create_table :state_reports do |t|
      t.integer :under_observation
      t.integer :under_home_isolation
      t.integer :hospitalised_today
      t.integer :total_hospitalised
      t.integer :corona_positive
      t.integer :cured_discharged
      t.integer :deaths
      t.integer :number_samples_tested
      t.integer :number_of_negative_samples
      t.references :state
      t.timestamps
    end
  end
end
