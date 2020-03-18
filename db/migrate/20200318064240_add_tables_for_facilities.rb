class AddTablesForFacilities < ActiveRecord::Migration[6.0]
  def change
    create_table :facility_types do |t|
      t.string :title
    end

    create_table :facilities do |t|
      t.string :name
      t.integer :number_of_beds
      t.integer :number_of_icu_beds
      t.references :district
      t.references :facility_type
      t.timestamps
    end

    create_table :facility_admins do |t|
      t.string :email, null: false, default: ""
      t.references :facility
      t.timestamps
    end

    create_table :facility_reports do |t|
      t.integer :under_observation
      t.integer :under_home_isolation
      t.integer :hospitalised_today
      t.integer :total_hospitalised
      t.integer :corona_positive
      t.integer :cured_discharged
      t.integer :deaths
      t.integer :number_of_beds_available
      t.integer :number_of_icu_beds_available
      t.references :facility
      t.timestamps
    end

    remove_column :admin_users, :encrypted_password
    remove_column :admin_users, :reset_password_token
    remove_column :admin_users, :reset_password_sent_at
    remove_column :admin_users, :remember_created_at
  end
end
