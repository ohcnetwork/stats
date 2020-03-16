class AddCentralStatsTable < ActiveRecord::Migration[6.0]
  def change
    create_table :states do |t|
      t.string :name
    end

    create_table :districts do |t|
      t.references :state
      t.string :name
    end

    create_table :reports do |t|
      t.integer :under_observation
      t.integer :under_home_isolation
      t.integer :hospitalised_today
      t.integer :total_hospitalised
      t.integer :corona_positive
      t.integer :cured_discharged
      t.integer :deaths
      t.references :district
    end

    create_table :skills do |t|
      t.string :title
    end

    create_table :roles do |t|
      t.string :title
    end

    create_table :state_admins do |t|
      t.references :user
      t.references :state
    end

    create_table :volunteers do |t|
      t.references :user
      t.references :role
      t.references :skill
      t.boolean :available
    end

    add_column :users, :age, :integer
    add_column :users, :mobile_number, :bigint
    add_column :users, :gender, :string
    add_reference :users, :district
  end
end
