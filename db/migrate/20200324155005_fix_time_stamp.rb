class FixTimeStamp < ActiveRecord::Migration[6.0]
  def change
    change_column_default :reports, :created_at, nil
    change_column_default :reports, :updated_at, nil
  end
end
