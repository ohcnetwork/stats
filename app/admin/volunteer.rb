ActiveAdmin.register District do
  permit_params :user_id, :role_id, :skill_id, :available

  index do
    selectable_column
    id_column
    column :user_name
    column :role_title
    column :skill_title
    column :available
    actions
  end

  filter :name

  form do |f|
    f.inputs do
      f.input :state, as: :select
      f.input :role, as: :select
      f.input :skill, as: :select
      f.input :user, as: :select
    end
    f.actions
  end

end