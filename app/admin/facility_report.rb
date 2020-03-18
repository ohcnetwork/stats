ActiveAdmin.register FacilityReport do
  permit_params :under_observation, :under_home_isolation, :hospitalised_today, :total_hospitalised, :corona_positive,
    :cured_discharged, :deaths, :facility_id, :number_of_beds_available, :number_of_icu_beds_available

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
    column :facility
    column :number_of_beds_available
    column :number_of_icu_beds_available
    actions
  end

  filter :facility

  form do |f|
    f.inputs do
      f.input :under_observation
      f.input :under_home_isolation
      f.input :total_hospitalised
      f.input :hospitalised_today
      f.input :corona_positive
      f.input :cured_discharged
      f.input :deaths
      f.input :number_of_beds_available
      f.input :number_of_icu_beds_available
      f.input :facility, as: :select
    end
    f.actions
  end

  menu parent: 'facilities'
end