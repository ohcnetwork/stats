class DropTimestampsForReports < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :reports
  end
end
