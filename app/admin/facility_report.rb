ActiveAdmin.register FacilityReport do
  permit_params :facility_id, :number_of_beds_available, :number_of_icu_beds_available

  index do
    selectable_column
    id_column
    column :facility
    column :number_of_beds_available
    column :number_of_icu_beds_available
    actions
  end

  filter :facility

  form do |f|
    f.inputs do
      f.input :number_of_beds_available
      f.input :number_of_icu_beds_available
      f.input :facility, as: :select
    end
    f.actions
  end

  menu parent: 'facilities'
end