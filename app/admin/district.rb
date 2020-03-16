ActiveAdmin.register District do
  permit_params :name, :state_id

  index do
    selectable_column
    id_column
    column :name
    column :state
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :name
      f.input :state, as: :select
    end
    f.actions
  end

end