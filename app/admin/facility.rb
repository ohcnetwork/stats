ActiveAdmin.register Facility do
  permit_params :name, :number_of_beds, :number_of_icu_beds, :district_id, :facility_type_id

  index do
    selectable_column
    id_column
    column :name
    column :number_of_beds
    column :number_of_icu_beds
    column :district
    actions
  end

  filter :facility

  form do |f|
    f.inputs do
      f.input :name
      f.input :number_of_beds
      f.input :number_of_icu_beds
      f.input :district, as: :select
      f.input :facility_type_id, as: :select, collection: FacilityType.all.map { |u| [u.title.to_s, u.id] }
    end
    f.actions
  end

end