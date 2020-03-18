ActiveAdmin.register FacilityAdmin do
  permit_params :email, :facility_id

  index do
    selectable_column
    id_column
    column :email
    column :email
    column :facility
    column :created_at
    actions
  end

  filter :email
  filter :facility
  filter :created_at

  form do |f|
    f.inputs do
      f.input :email
      f.input :facility
    end
    f.actions
  end

  menu parent: 'facilities'
end
