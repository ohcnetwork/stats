class AddTimestampsForReports < ActiveRecord::Migration[6.0]
  def change
    add_timestamps :reports, default: Time.zone.now
  end
end
