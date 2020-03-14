class AddCentralStatsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name
    end

    create_table :daily_reports do |t|
      t.integer :cases
      t.integer :cured_discharged
      t.integer :deaths
      t.references :state
    end
  end
end
