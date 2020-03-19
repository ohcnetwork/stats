class RemoveColumnsFromFacility < ActiveRecord::Migration[6.0]
  def change
    remove_column :facility_reports, :under_observation
    remove_column :facility_reports, :under_home_isolation
    remove_column :facility_reports, :total_hospitalised
    remove_column :facility_reports, :corona_positive
    remove_column :facility_reports, :cured_discharged
    remove_column :facility_reports, :deaths
  end
end
