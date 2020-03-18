ActiveAdmin.register StateAdmin do
  permit_params :user_id, :state_id

  index do
    selectable_column
    id_column
    column :user
    column :state
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :user, as: :select
      f.input :state, as: :select
    end
    f.actions
  end

  menu parent: 'dashboard'
end