ActiveAdmin.register StateReport do
  permit_params :under_observation, :under_home_isolation, :hospitalised_today, :number_of_negative_samples, :number_samples_tested, :updated_at, :created_at, :total_hospitalised, :corona_positive, :cured_discharged, :deaths, :state_id

  index do
    selectable_column
    id_column
    column :under_observation
    column :under_home_isolation
    column :total_hospitalised
    column :hospitalised_today
    column :corona_positive
    column :cured_discharged
    column :deaths
    column :district
    column :number_of_negative_samples
    column :number_samples_tested
    actions
  end

  filter :state

  form do |f|
    f.object.created_at = DateTime.now
    f.object.updated_at = DateTime.now
    f.inputs do
      f.input :under_observation
      f.input :under_home_isolation
      f.input :total_hospitalised
      f.input :hospitalised_today
      f.input :corona_positive
      f.input :cured_discharged
      f.input :deaths
      f.input :number_of_negative_samples
      f.input :number_samples_tested
      f.input :created_at
      f.input :updated_at
      f.input :state, as: :select
    end
    f.actions
  end

  menu parent: 'States'
end